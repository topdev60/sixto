@extends('Frontend.layouts.app')
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
                    <div class="col-md-12 col-lg-12">
                        <div class="row">
                            <div class="col-md-3 col-lg-3">
                                <div id="guageDiv0" data-value="pressure" data-type="pressureData" class="gauge"></div>
                                <div class="input-group mb-3 gauge-input">
                                    <input type="number" class="form-control input-value value" step="0.01" placeholder="Value">
                                </div>
                            </div>
                            <div class="col-md-3 col-lg-3">
                                <div id="guageDiv1" data-value="ppValue" data-type="porepressureData" class="gauge"></div>
                                <div class="input-group mb-3 gauge-input">
                                    <input type="number" class="form-control input-value value" step="0.01" placeholder="Value">
                                </div>
                            </div>
                            <div class="col-md-3 col-lg-3">
                                <div id="guageDiv2" data-value="temperature" data-type="temperatureData" class="gauge"></div>
                                <div class="input-group mb-3 gauge-input">
                                    <input type="number" class="form-control input-value value" step="0.01" placeholder="Value">
                                </div>
                            </div>
                            <div class="col-md-3 col-lg-3">
                                <div id="guageDiv3" data-value="tgValue" data-type="temperatureGradientData" class="gauge"></div>
                                <div class="input-group mb-3 gauge-input">
                                    <input type="number" class="form-control input-value value" step="0.01" placeholder="Value">
                                </div>
                            </div>
                            {{-- <div class="col-md-4 col-lg-4">
                                <div id="flat-slider" class="flat-slider-0"></div>
                            </div>
                            <div class="col-md-4 col-lg-4">
                                <div id="flat-slider" class="flat-slider-1"></div>
                            </div> --}}
                        </div>
                    </div>
                    {{-- <div class="col-md-4 col-lg-4">
                        Name: {{session()->get('projectInfo')->project_name}}
                    </div> --}}
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div id="divplot0" data-type="pressureData"></div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div id="divplot1" data-type="porepressureData"></div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div id="divplot2" data-type="temperatureData"></div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div id="divplot3" data-type="temperatureGradientData"></div>
            </div>
        </div>
    </div>
</section>
@endsection