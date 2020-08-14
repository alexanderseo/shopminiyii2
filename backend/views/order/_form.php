<?php

use common\models\OrderItem;
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\Order */
/* @var $form yii\widgets\ActiveForm */
/* @var $products array */

$i = 0;
?>

<div class="order-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'customer')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'status')->textInput() ?>

    <div class="box box-solid box-primary">
        <div class="box-header">
            <h3 class="box-title">Товары</h3>
        </div>
        <div class="box-body">
            <?php foreach ($model->items as $item): ?>
                <div class="row form-group">
                    <input type="hidden" name="OrderItem[<?=$i ?>][id]" value="<?= $item->id ?>">
                    <input type="hidden" name="OrderItem[<?=$i ?>][order_id]" value="<?= $model->id ?>">
                    <div class="col-sm-8">
                        <?= Html::dropDownList(
                            "OrderItem[$i][product_id]",
                            $item->product_id, $products,
                            ['class' => 'form-control']
                        ) ?>
                    </div>
                    <div class="col-sm-3">
                        <?= Html::input('number', "OrderItem[$i][quantity]", $item->quantity, ['class' => 'form-control']) ?>
                    </div>
                    <div class="col-sm-1">
                        <?= Html::button('Удалить', ['class' => 'btn btn-danger remove-product']) ?>
                    </div>
                    <?php $i++ ?>
                </div>
            <?php endforeach; ?>

            <div class="more-products"></div>
            <button class="btn btn-success add-product">Добавить товар</button>
        </div>
    </div>

    <div class="form-group">
        <?= Html::submitButton('Сохранить', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        var i = <?= $i ?>;
        $('.add-product').on('click', function() {
            var html = `
<div class="row form-group">
    <input type="hidden" name="OrderItem[${i}][order_id]" value="<?= $model->id ?>">
    <div class="col-sm-8">
        <select class="form-control" name="OrderItem[${i}][product_id]">
            <?php foreach ($products as $index => $product): ?>
                <option value="<?= $index ?>"><?= $product ?></option>
            <?php endforeach ?>
        </select>
    </div>
    <div class="col-sm-3">
        <input type="number" class="form-control" name="OrderItem[${i}][quantity]" value="1">
    </div>
    <div class="col-sm-1">
        <button type="button" class="btn btn-danger remove-product">Удалить</button>
    </div>
</div>
            `;
            $('.more-products').append(html);
            i++;
            return false;
        });
        $('.remove-product').on('click', function() {
            $(this).parents('.form-group').remove();
        });
    });
</script>