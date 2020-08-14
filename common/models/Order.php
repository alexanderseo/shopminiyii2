<?php

namespace common\models;

use lhs\Yii2SaveRelationsBehavior\SaveRelationsBehavior;
use lhs\Yii2SaveRelationsBehavior\SaveRelationsTrait;

/**
 * This is the model class for table "{{%orders}}".
 *
 * @property int $id
 * @property string $customer
 * @property int $status
 * @property OrderItem[] $items
 *
 * @property Product[] $products
 */
class Order extends \yii\db\ActiveRecord
{
    const STATUS_NEW = 0;
    const STATUS_COMPLETE = 10;

    public static function tableName()
    {
        return '{{%orders}}';
    }

    public function rules()
    {
        return [
            [['customer', 'status'], 'required'],
            [['status'], 'integer'],
            [['customer'], 'string', 'max' => 255],
        ];
    }

    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'customer' => 'Покупатель',
            'status' => 'Статус',
        ];
    }

    public function isNew()
    {
        return $this->status === self::STATUS_NEW;
    }

    public function isComplete()
    {
        return $this->status === self::STATUS_COMPLETE;
    }

    public function getItems()
    {
        return $this->hasMany(OrderItem::class, ['order_id' => 'id']);
    }

    public function behaviors()
    {
        return [
            'saveRelations' => [
                'class' => SaveRelationsBehavior::class,
                'relations' => [
                    'items' => ['cascadeDelete' => true],
                ],
            ],
        ];
    }

    public function getTotalPrice()
    {
        $items = $this->items;
        $total = 0;
        foreach ($items as $item) {
            $total += $item->product->price * $item->quantity;
        }
        return $total;
    }

    public function getProductsCount()
    {
        $items = $this->items;
        $count = 0;
        foreach ($items as $item) {
            $count += $item->quantity;
        }
        return $count;
    }

    public function transactions()
    {
        return [
            self::SCENARIO_DEFAULT => self::OP_ALL,
        ];
    }

    public function loadItems($post)
    {
        $items = [];
        foreach (($post['OrderItem'] ?? []) as $item) {
            $params = [];
            if ($item['id']) {
                $orderItem = OrderItem::findOne((int) $item['id']);
                $orderItem->quantity = (int) $item['quantity'];
                $items[] = $orderItem;
                continue;
            };
            $params['order_id'] = $this->id;
            $params['product_id'] = (int) $item['product_id'];
            $params['quantity'] = (int) $item['quantity'];
            $items[] = new OrderItem($params);
        }
        return $items;
    }
}
