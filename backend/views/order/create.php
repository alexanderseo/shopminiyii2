<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Order */
/* @var $products array */

$this->title = 'Добавить заказ';
$this->params['breadcrumbs'][] = ['label' => 'Orders', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="box">
    <div class="box-body">
        <?= $this->render('_form', [
            'model' => $model,
            'products' => $products,
        ]) ?>
    </div>
</div>
