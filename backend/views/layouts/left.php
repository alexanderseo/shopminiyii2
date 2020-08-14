<aside class="main-sidebar">

    <section class="sidebar">

        <?= dmstr\widgets\Menu::widget(
            [
                'options' => ['class' => 'sidebar-menu tree', 'data-widget'=> 'tree'],
                'items' => [
                    ['label' => 'Gii', 'icon' => 'file-code-o', 'url' => ['/gii']],
                    ['label' => 'Debug', 'icon' => 'dashboard', 'url' => ['/debug']],
                    ['label' => 'Меню', 'options' => ['class' => 'header']],
                    ['label' => 'Товары', 'icon' => 'list', 'url' => ['/product']],
                    ['label' => 'Заказы', 'icon' => 'list', 'url' => ['/order']],
                ],
            ]
        ) ?>

    </section>

</aside>
