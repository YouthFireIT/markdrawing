@extends('backend.layouts.master')
@section('css')
    <link rel="stylesheet" href="{{ asset('assets/admin/vendor/drug-drop-image-upload/image-uploader.css') }}">
@endsection
@section('view_button')
    <a href="{{ route('product.show', $product->slug) }}" target="_blank">View Product</a>
@endsection
@section('save_button')
    <a href="#" id="update_button">Update</a>
@endsection
@section('content')

    <div class="row">

        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">

            <div class="card">
                <h5 class="card-header">Update Product</h5>
                <div class="card-body">
                    @include('backend.layouts.error')
                    <form action="{{ route('admin.product.update', $product->id) }}" method="post"
                        enctype="multipart/form-data" id="form">
                        {{ csrf_field() }}
                        <div class="form-group">
                            <div class="row">
                                <div class="col">
                                    <label for="name" class="col-form-label">Title*</label>
                                    <input id="name" type="text" class="form-control" name="title" required=""
                                        value="{{ $product->title }}">
                                </div>

                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row">
                                <div class="col">
                                    <label for="description">Description*</label>
                                    <textarea class="form-control" id="description" rows="3" name="description"
                                        required="">{{ $product->description }}</textarea>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="quantity" class="col-form-label">Quantity</label>
                            <input id="quantity" type="number" class="form-control" name="quantity"
                                value="{{ $product->quantity }}" required="">
                        </div>

                        @if ($product->images != null)
                            <div class="form-group">
                                <label for="image" class="col-form-label">Images</label>
                                <div class="row">
                                    @foreach ($product->images as $image)
                                        <div class="col-md-2">
                                            <img src="{{ asset('images/' . $image->image) }}" width="100"><a
                                                href="{{ route('admin.product.image.delete', $image->id) }}"><i
                                                    class="fas fa-times-circle" style="
                        margin-left: 7px;
                        position: absolute;
                        "></i></a>
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                        @endif


                        <div class="input-images"></div>

                        <div class="form-group">
                            <label for="sku" class="col-form-label">SKU / Product Code</label>
                            <input id="sku" type="text" class="form-control" name="sku" value="{{ $product->sku }}">
                        </div>

                        <div class="form-group">
                            <label for="category">Category</label>
                            <select class="form-control" id="category" name="category" required="">
                                @foreach ($main_categories as $main_category)
                                    <option value="{{ $main_category->id }}" style="font-weight: 700;" @if ($main_category->id == $product->category_id)
                                        selected=""
                                @endif
                                >{{ $main_category->name }} </option>
                                @foreach ($sub_categories as $sub_category)

                                    <option value="{{ $sub_category->id }}" @if ($sub_category->id == $product->category_id)
                                        selected=""
                                @endif

                                >- {{ $sub_category->name }} </option>

                                @endforeach
                                @endforeach
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="price" class="col-form-label">Price</label>
                            <input id="price" type="text" class="form-control" name="price" value="{{ $product->price }}">
                        </div>

                        <div class="form-group">
                            <label for="category">Status</label>

                            <select class="form-control" id="status" name="status">
                                <option value="0" style="font-weight: 700;">InActive</option>
                                <option value="1" style="font-weight: 700;">Active</option>
                            </select>
                        </div>


                        <div class="form-group">
                            <input type="submit" class="btn btn-success" value="Update">
                        </div>


                    </form>
                </div>

            </div>
        </div>

    @endsection


    @section('script')

        <script type="text/javascript">
            $(document).ready(function() {
                var maxField = 10; //Input fields increment limitation
                var addButton = $('.add_button'); //Add button selector
                var wrapper = $('.field_wrapper'); //Input field wrapper
                var fieldHTML =
                    '<div class="form-group col-md-8" style="padding-left: 0"><label>Add Attribute</label><input type="text" name="field_name[]" class="form-control" placeholder="Title" value="" /><br><textarea name="attribute_options[]" class="form-control" placeholder="Attribute option must need to separate by ," value=""></textarea><br><a href="javascript:void(0);" class="remove_button btn btn-warning">Remove</a></div>'; //New input field html 
                var x = 1; //Initial field counter is 1

                //Once add button is clicked
                $(addButton).click(function() {
                    //Check maximum number of input fields
                    if (x < maxField) {
                        x++; //Increment field counter
                        //$(wrapper).append(fieldHTML); //Add field html
                        $(wrapper).append(
                            '<div class="form-group col-md-8" style="padding-left: 0"><label>Add Attribute</label><br><label style="font-size: 13px;">Title (Ex Color)</label><input type="text" name="attribute_name[]" class="form-control" placeholder="Title" value="" /><br><label style="font-size: 13px;">Options (Ex Green,Red,White)</label><br><textarea name="attribute_option[]" class="form-control" placeholder="Attribute option must need to separate by ," value=""></textarea><br><a href="javascript:void(0);" class="remove_button btn btn-warning">Remove</a></div>'
                            );
                    }
                });

                //Once remove button is clicked
                $(wrapper).on('click', '.remove_button', function(e) {
                    e.preventDefault();
                    $(this).parent('div').remove(); //Remove field html
                    x--; //Decrement field counter
                });
            });

        </script>


        <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-bs4.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-bs4.min.js"></script>

        <script>
            $('#description').summernote({
                placeholder: '',
                tabsize: 2,
                height: 300
            });
            $('#description_bd').summernote({
                placeholder: '',
                tabsize: 2,
                height: 300
            });

            $('#specifications').summernote({
                placeholder: '',
                tabsize: 2,
                height: 300
            });

            $('#specifications_bd').summernote({
                placeholder: '',
                tabsize: 2,
                height: 300
            });

        </script>

        <script type="text/javascript">
            $("#update_button").click(function() {
                $("#form").submit();
            });

        </script>

        <script src="{{ asset('assets/admin/vendor/drug-drop-image-upload/product-image-uploader.js') }}"></script>
        <script type="text/javascript">
            $('.input-images').imageUploader();

        </script>

    @endsection
