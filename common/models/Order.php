<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "{{%orders}}".
 *
 * @property int $id
 * @property string $customer
 * @property int $status
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

    public function getProducts()
    {
        return $this->hasMany(Product::class, ['id' => 'product_id'])
            ->viaTable('order_products', ['order_id' => 'id']);
    }
}
