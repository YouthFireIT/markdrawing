@extends('frontend.layouts.home')

@section('content')

    <div class="container">
        <div class="row mb-8">
            <div class="col-xl-9 col-wd-9gdot5">
                <div class="tab-content" id="pills-tabContent">
                    <div class="tab-pane fade pt-2 show active" id="pills-one-example1" role="tabpanel" aria-labelledby="pills-one-example1-tab" data-target-group="groups">
                        <ul class="row list-unstyled products-group no-gutters">
                           @forelse($products as $product)
                            <li class="col-6 col-md-3 col-wd-2gdot4 product-item">
                                <div class="" id="single_product_id">
                                <input type="hidden" class="product_id" value="{{$product->id}}" >
                                    <div class="product-item__outer h-100">
                                        <div class="product-item__inner bg-white px-wd-4 p-2 p-md-3">
                                            <div class="product-item__body pb-xl-2">
                                                <h5 class="mb-1 product-item__title"><a href="{{route('product.show', $product->slug)}}" class="text-blue font-weight-bold">
                                                    @if(Config::get('app.locale') == 'bd')
            
                                                    @if(!is_null($product->title_bd))
                                                        {{ $product->title_bd }}
                                                    @else
                                                        {{ $product->title }}
                                                    @endif
            
                                                    @elseif(Config::get('app.locale') == 'en')
                                                        {{ $product->title }}
                                                    @endif
                                                
                                                </a></h5>
                                                <div class="mb-2">
                                                    <a href="{{route('product.show', $product->slug)}}" class="d-block text-center">
                                                        @php
                                                            $i = 1;
                                                        @endphp
                                                    @if(!is_null($product->images))
                                                        @foreach($product->images as $image)
                                                            @if($i>0)
                                                                <img src="{{ asset('images/'.$image->image) }}" class="img-fluid" style="width: 172px; height:172px">
                                                            @endif
                                                        @php
                                                            $i--;
                                                        @endphp
                                                        @endforeach
                                                    @else
                                                    <img src="{{asset('images/no-img.jpg')}}" class="img-fluid" style="width: 172px; height:172px">
                                                    @endif
                                                    </a>
                                                </div>
                                                @include('frontend.layouts.partials.add-to-cart')
            
                                            </div>
                                            
                                        </div>
                                    </div>
                                </div>
                            </li>
                            @empty
                                <div class="col-12 text-center">
                                    <h3 class="bg-danger px-5 py-2 ml-5">No Product Under This Subcategory</h3>
                                </div>
                            @endforelse
                
                            
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        
    </div>
</main>
<!-- ========== END MAIN CONTENT ========== -->

@endsection

@section('extra_script')
<script src="{{asset('assets/js/nouislider.min.js')}}"></script>

@endsection