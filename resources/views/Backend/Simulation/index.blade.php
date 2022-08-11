@extends('Backend.layouts.app')
@section('content')
<script src="{{ asset('assets/js/simulation.js') }}"></script>
<script src="{{ asset('assets/js/guage.js') }}"></script>
<script src="{{ asset('assets/js/slider.js') }}"></script>
<section class="home-section" id="home-section">
    <div class="container-fluid">
        {{---title---}}
        <div class="d-flex align-items-center justify-content-between mb-3">
            <div class="h4 mb-0">
                {{$module}}
            </div>
        </div>
        <div class="row gy-4">
            <div class="col-md-12 col-lg-12 top-wrapper">
                <div class="row gy-4">
                    <div class="col-md-8 col-lg-8">
                        <div class="row">
                            <div class="col-md-4 col-lg-4">
                                <div id="guageDiv0"></div>
                            </div>
                            <div class="col-md-4 col-lg-4">
                                <div id="guageDiv1"></div>
                            </div>
                            <div class="col-md-4 col-lg-4">
                                <div id="sliderDiv0"></div>
                            </div>
                            <div class="col-md-4 col-lg-4">
                                <div id="sliderDiv1"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-lg-4">
                        Name: {{session()->get('projectInfo')->project_name}}
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div id="divplot0"></div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div id="divplot1"></div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div id="divplot2"></div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div id="divplot3"></div>
            </div>
        </div>
    </div>
</section>
@endsection