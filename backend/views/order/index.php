<?php

use common\models\Order;
use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\OrderQuery */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Заказы';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="box">
    <div class="box-body">

        <p>
            <?= Html::a('Добавить заказ', ['create'], ['class' => 'btn btn-success']) ?>
        </p>

        <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

        <?= GridView::widget([
            'dataProvider' => $dataProvider,
            'filterModel' => $searchModel,
            'columns' => [

                'id',
                'customer',
                [
                    'label' => 'Статус',
                    'value' => function($item) {
                        if ($item->isNew()) return '<span class="label label-primary">Новый</span>';
                        if ($item->isComplete()) return '<span class="label label-success">Выполнен</span>';
                        return '';
                    },
                    'format' => 'raw',
                    'attribute' => 'status',
                    'filter' => [
                        Order::STATUS_NEW => 'Новый',
                        Order::STATUS_COMPLETE => 'Выполнен',
                    ]
                ],
                [
                    'label' => 'Всего товаров',
                    'value' => function($item) {
                        return $item->getProductsCount();
                    }
                ],
                [
                    'label' => 'Цена',
                    'value' => function($item) {
                        return $item->getTotalPrice();
                    }
                ],

                ['class' => 'yii\grid\ActionColumn'],
            ],
        ]); ?>

    </div>
</div>
