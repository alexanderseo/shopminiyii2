<?php
namespace common\fixtures;

use common\models\Order;
use common\models\Product;
use yii\test\ActiveFixture;

class OrderItemFixture extends ActiveFixture
{
    public $modelClass = 'common\models\OrderItem';

    public function getData()
    {
        $data = [];
        foreach (range(1,500) as $i) {
            $order = Order::find()->select('id')->limit(1)->orderBy('rand()')->scalar();
            $product = Product::find()->select('id')->limit(1)->orderBy('rand()')->scalar();
            $data[] = [
                'order_id' => $order,
                'product_id' => $product,
                'quantity' => rand(1,10),
            ];
        }
        return $data;
    }
}