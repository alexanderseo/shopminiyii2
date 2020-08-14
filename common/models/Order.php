<?php

namespace common\models;

use lhs\Yii2SaveRelationsBehavior\SaveRelationsBehavior;

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

    public function transactions()
    {
        return [
            self::SCENARIO_DEFAULT => self::OP_ALL,
        ];
    }
}
