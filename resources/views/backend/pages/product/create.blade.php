@php
    use App\Category;
@endphp
@extends('backend.layouts.master')

@section('css')
    <link rel="stylesheet" href="{{ asset('assets/admin/vendor/drug-drop-image-upload/image-uploader.css') }}">
@endsection

@section('save_button')
    <a href="#" id="save_button">Add</a>
@endsection

@section('content')

<div class="row">

<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
    
    <div class="card">
        <h5 class="card-header">Add New Product</h5>
        <div class="card-body">
            @include('backend.layouts.error')
            <form action="{{ route('admin.product.store') }}" method="post" enctype="multipart/form-data">
                {{ csrf_field() }}

                <div class="form-group">
                    <div class="row">
                    <div class="col">
                    <label for="name" class="col-form-label">Title*</label>
                    <input id="name" type="text" class="form-control" name="title" required="">
                    </div>
                    </div>
                </div>


                <div class="form-group">
                    <div class="row">
                    <div class="col">
                    <label for="description">Description*</label>
                    <textarea class="form-control" id="description" rows="3" name="description" required=""></textarea>
                    </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="quantity" class="col-form-label">Quantity*</label>
                    <input id="quantity" type="number" class="form-control" name="quantity" required="">
                </div>
                <label>Images</label>
                <div class="input-images"></div>

                <div class="form-group">
                    <label for="sku" class="col-form-label">SKU / Product Code</label>
                    <input id="sku" type="text" class="form-control" name="sku">
                </div>

                <div class="form-group">
                    <label for="category">Category*</label>
                    <select class="form-control" id="category" name="category" required="">
                        <option value="">Select Category</option>
                    @foreach($main_categories as $main_category)
                       <option value="{{$main_category->id}}" style="font-weight: 700;" >{{ $main_category->name }} </option>
                       @php
                           $sub_categories = Category::where('parent_id', $main_category->id)->orderBy('name','asc')->get();
                       @endphp
                        @foreach($sub_categories as $sub_category)                            
                            <option value="{{$sub_category->id}}">- {{ $sub_category->name }} </option>                                                        
                        @endforeach
                    @endforeach                      
                    </select>
                </div>

                <div class="field_wrapper">
                    <div class="form-group col-md-8" style="padding-left: 0">
                        <input type="hidden" name="attribute_name[]" class="form-control" value="Price" /><br>
                        <label>Price</label><br>
                        <input id="price" type="text" class="form-control" name="price" required="">
                    </div>
                </div>

                <div class="form-group">
                    <label for="category">Status</label>
                    <select class="form-control" id="status" name="status">                       
                       <option value="0" style="font-weight: 700;" >InActive</option> 
                       <option value="1" style="font-weight: 700;" >Active</option>                     
                    </select>
                </div>

                <div class="form-group">
                    <input type="submit" class="btn btn-success" value="Add" id="submit">
                </div>
                
            </form>
        </div>

    </div>
</div>

@endsection

@section('script')

<script type="text/javascript">

$(document).ready(function(){
    var maxField = 10; //Input fields increment limitation
    var addButton = $('.add_button'); //Add button selector
    var wrapper = $('.field_wrapper'); //Input field wrapper
    var fieldHTML = '<div class="form-group col-md-8" style="padding-left: 0"><label>Add Attribute</label><input type="text" name="field_name[]" class="form-control" placeholder="Title" value="" /><br><textarea name="attribute_options[]" class="form-control" placeholder="Attribute option must need to separate by ," value=""></textarea><br><a href="javascript:void(0);" class="remove_button btn btn-warning">Remove</a></div>'; //New input field html 
    var x = 1; //Initial field counter is 1
    
    //Once add button is clicked
    $(addButton).click(function(){
        //Check maximum number of input fields
        if(x < maxField){ 
            x++; //Increment field counter
            //$(wrapper).append(fieldHTML); //Add field html
            $(wrapper).append('<div class="form-group col-md-8" style="padding-left: 0"><label>Add Attribute</label><br><label style="font-size: 13px;">Title (Ex Color)</label><input type="text" name="attribute_name[]" class="form-control" placeholder="Title" value="" /><br><label style="font-size: 13px;">Options (Ex Green,Red,White)</label><br><textarea name="attribute_option[]" class="form-control" placeholder="Attribute option must need to separate by ," value=""></textarea><br><a href="javascript:void(0);" class="remove_button btn btn-warning">Remove</a></div>');
        }
    });
    
    //Once remove button is clicked
    $(wrapper).on('click', '.remove_button', function(e){
        e.preventDefault();
        $(this).parent('div').remove(); //Remove field html
        x--; //Decrement field counter
    });
});
</script>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-bs4.min.js"></script>


<script src="{{ asset('assets/admin/vendor/drug-drop-image-upload/product-image-uploader.js') }}"></script>
<script type="text/javascript">
$('#description').summernote({
        placeholder: '',
        tabsize: 2,
        height: 300
      });
    $('.input-images').imageUploader();

    //Save button
    $("#save_button").click(function(){
    $("#submit").click(); 
    });
</script>

@endsection