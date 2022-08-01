@extends('Frontend.layouts.app')
@section('content')
@if (isset($tab))
    <input type="hidden" id="chartDataType" value="{{$tab}}">
@endif
<section class="home-section" id="home-section">
    <div class="container-fluid">
        <div class="d-flex align-items-center justify-content-between mb-3">
            <div class="h4 mb-0">
                {{__('Formation Pressure')}}
            </div>
        </div>
        <div class="col-md-12 col-lg-6">
            <ul class="nav nav-tabs nav-fill" id="myTab" role="tablist">
                <li class="nav-item" role="presentation">
                    <a href="{{route('user.formation.show', 'porepressure')}}" @if($tab == 1) class="nav-link active" @endif class="nav-link" id="home-tab">{{__('PORE PRESSURE')}}</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a href="{{route('user.formation.show', 'fracture')}}" @if($tab == 2) class="nav-link active" @endif class="nav-link" id="profile-tab">{{__('FRACTURE PRESSURE')}}</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a href="{{route('user.formation.show', 'formation')}}" @if($tab == 3) class="nav-link active" @endif class="nav-link" id="contact-tab">{{__('FORMATION TEMPERATURE')}}</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a href="{{route('user.formation.show', 'lithology')}}" @if($tab == 4) class="nav-link active" @endif class="nav-link" id="contact-tab">{{__('LITHOLOGY TABLE')}}</a>
                </li>
            </ul>
        </div>
        <div class="row gy-4 mt-2">
            <div class="tab-content" id="myTabContent">
                @yield('tab-content')
            </div>
        </div>
    </div>
</section>
@endsection