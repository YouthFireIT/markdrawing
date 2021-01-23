<!-- top navigation -->
<section id="top_navbar">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="top_nav_left">
                    <ul class="tln_social_icon">
                        <li class="">
                            <span class="tnl_text">
                                Follow us on:
                            </span>
                        </li>
                        <li class="">
                            <a href="#" class=""><i class="fab fa-facebook-f"></i></a>
                        </li>
                        <li class="">
                            <a href="#" class=""><i class="fab fa-instagram"></i></a>
                        </li>
                        <li class="">
                            <a href="#" class=""><i class="fab fa-youtube"></i></a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-md-6">
                <div class="top_nav_right float-right">
                    <ul class="top_nav_right_menu">
                        @guest
                        <li class=""><a href="{{ route('login') }}" class="">
                            <i class="fas fa-user"></i>
                            <span class="tnr_menu_item">login</span>
                        </a></li>
                        @if (Route::has('register'))
                        <li class=""><a href="{{ route('register') }}" class="">
                            <i class="fas fa-user-plus"></i>
                            <span class="tnr_menu_item">register</span>
                        </a></li>

                        @endif
                        @else

                        <li class="">
                            <a id="navbarDropdown" class="" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                                {{ Auth::user()->name }}&nbsp;&darr;
                            </a>

                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="{{ route('logout') }}"
                                   onclick="event.preventDefault();
                                                 document.getElementById('logout-form').submit();">
                                    {{ __('Logout') }}
                                </a>

                                <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                                    @csrf
                                </form>
                            </div>
                        </li>
                      

                        <li class=""><a href="cart.html" class="">
                            <a href="{{ route('carts') }}"><i class="fas fa-shopping-cart"></i></a>
                            <span class="tnr_menu_item">{{Session::get('cartCount')}}</span>
                        </a></li>

                        @endguest
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- navbar -->
<section id="navbar_part">
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light px-0">
            <a class="navbar-brand" href="{{route('index')}}">
                <img src="{{asset('markdrawing/img/logo.png')}}" alt="" class="img-fluid my_logo">
            </a>
            <!-- Button trigger modal -->
            <button type="button" class="btn text-dark modal_search d-lg-none d-md-block" data-toggle="modal" data-target="#exampleModal">
              <i class="fas fa-search"></i>
            </button>
            <!-- Button trigger modal end-->
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto my_nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="{{route('index')}}">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{{route('portait')}}">Portraits</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="artworkprints.html">Artwork Prints</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{{route('family.portait')}}">Family Portrait</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="review.html">Reviews</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="faq.html">FAQ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="contact_us.html">Contact us</a>
                    </li>
                    
                </ul>
                <form class="form-inline my-2 my-lg-0 nav_serach_bar">
                    <input class="form-control" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-dark my-2 my-sm-0" type="submit"><i class="fas fa-search"></i></button>
                </form>
            </div>
        </nav>
    </div>
</section>