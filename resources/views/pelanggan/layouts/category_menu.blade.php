<div class="left-sidebar">
    <?php
    $categories = DB::table('categories')->get();
    ?>
    <h2>Daftar Kategori</h2>
    <div class="panel-group category-products" id="accordian">
        <!--category-productsr-->
        @foreach($categories as $category)
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a href="{{route('cats',$category->id)}}">{{$category->name}}</a>
                </h4>
            </div>
        </div>
        @endforeach
    </div>
    <!--/category-products-->

</div>