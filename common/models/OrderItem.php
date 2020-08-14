<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "{{%order_items}}".
 *
 * @property int $id
 * @property int $order_id
 * @property int $product_id
 * @property int $quantity
 *
 * @property Order $order
 * @property Product $product
 */
class OrderItem extends \yii\db\ActiveRecord
{
    public static function tableName()
    {
        return '{{%order_items}}';
    }

    public function rules()
    {
        return [
            [['order_id', 'product_id', 'quantity'], 'required'],
            [['order_id', 'product_id', 'quantity'], 'integer'],
            [['order_id'],
                'exist', 'skipOnError' => true,
                'targetClass' => Order::class, 'targetAttribute' => ['order_id' => 'id']
            ],
            [['product_id'],
                'exist', 'skipOnError' => true,
                'targetClass' => Product::class, 'targetAttribute' => ['product_id' => 'id']
            ],
        ];
    }

    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'order_id' => 'Заказ',
            'product_id' => 'Товар',
            'quantity' => 'Количество',
        ];
    }

    public function getOrder()
    {
        return $this->hasOne(Order::class, ['id' => 'order_id']);
    }

    public function getProduct()
    {
        return $this->hasOne(Product::class, ['id' => 'product_id']);
    }
}
