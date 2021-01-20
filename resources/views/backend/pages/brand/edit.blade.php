@extends('backend.layouts.master')

@section('content')

<div class="row">

<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
    
    <div class="card">
        <h5 class="card-header">Edit Print</h5>
        <div class="card-body">
            @include('backend.layouts.error')
            <form action="{{ route('admin.brand.update', $brand->id) }}" method="post" enctype="multipart/form-data">
                @csrf
                <div class="form-group">
                    <div class="col">
                        <label for="name" class="col-form-label">Name</label>
                        <input id="name" type="text" class="form-control" name="name" value="{{$brand->name}}" required="">
                    </div>
                </div>

                <div class="form-group">
                    <div class="col">
                        <label for="amount" class="col-form-label">Amount</label>
                        <input id="amount" type="text" class="form-control" name="amount" value="{{$brand->amount}}" required="">
                    </div>
                </div>

                <div class="form-group">
                    <input type="submit" class="btn btn-success" value="Update">
                </div>

                
            </form>
        </div>

    </div>
</div>

@endsection