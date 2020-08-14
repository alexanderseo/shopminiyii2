<?php
namespace common\fixtures;

use common\models\Order;
use Faker\Factory;
use yii\test\ActiveFixture;

class OrderFixture extends ActiveFixture
{
    public $modelClass = 'common\models\Order';
    public function getData()
    {
        $faker = Factory::create('ru_RU');
        $data = [];
        foreach (range(1,50) as $i) {
            $data[] = [
                'customer' => $faker->name,
                'status' => $faker->randomElement([Order::STATUS_COMPLETE, Order::STATUS_NEW]),
            ];
        }
        return $data;
    }
}