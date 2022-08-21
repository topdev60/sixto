@extends('Frontend.layouts.app')
@section('content')
<section class="home-section" id="home-section">
    <div class="container-fluid">
        {{---title---}}
        <div class="d-flex align-items-center justify-content-between mb-3">
            <div class="h4 mb-0">
                {{$module}}
            </div>
        </div>
        @php
            $preferPressure         = $preferPressure->Pressure;
            $preferTemperature      = $preferTemperature->Temperature;
            $preferDensity          = $preferDensity->Density;
            $preferFlow             = $preferFlow->Flow;
            $preferLength           = $preferLength->Length;
            $preferDiameter         = $preferDiameter->Diameter;
        @endphp
        <div class="row gy-4">
            <div class="col-md-12 col-lg-6 mx-auto">
                <div class="card">
                    <div class="card-header">
                        {{__('Prefer Unit')}}
                    </div>
                    <div class="card-body">
                        <form action="{{route('user.units.update')}}" method="POST">
                        @csrf
                            <div class="row">
                                <div class="col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label for="Pressure" class="form-label">Pressure</label>
                                        <select name="pressure" class="form-select">
                                            @foreach ($pressureUnits as $item)
                                                @php
                                                    $selected = '';
                                                    if($preferPressure == $item->id) $selected = 'selected';
                                                @endphp
                                                <option value="{{$item->id}}" {{$selected}}>{{$item->name}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label for="Temperature" class="form-label">Temperature</label>
                                        <select name="temperature" class="form-select">
                                            @foreach ($temperatureUnits as $item)
                                                @php
                                                    $selected = '';
                                                    if($preferTemperature == $item->id) $selected = 'selected';
                                                @endphp
                                                <option value="{{$item->id}}" {{$selected}}>{{$item->name}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label for="Density" class="form-label">Density</label>
                                        <select name="density" class="form-select">
                                            @foreach ($densityUnits as $item)
                                                @php
                                                    $selected = '';
                                                    if($preferDensity == $item->id) $selected = 'selected';
                                                @endphp
                                                <option value="{{$item->id}}" {{$selected}}>{{$item->name}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label for="Flow" class="form-label">Flow</label>
                                        <select name="flow" class="form-select">
                                            @foreach ($flowUnits as $item)
                                                @php
                                                    $selected = '';
                                                    if($preferFlow == $item->id) $selected = 'selected';
                                                @endphp
                                                <option value="{{$item->id}}" {{$selected}}>{{$item->name}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label for="Length" class="form-label">Length</label>
                                        <select name="length" class="form-select">
                                            @foreach ($lengthUnits as $item)
                                                @php
                                                    $selected = '';
                                                    if($preferLength == $item->id) $selected = 'selected';
                                                @endphp
                                                <option value="{{$item->id}}" {{$selected}}>{{$item->name}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label for="Length" class="form-label">Diameter</label>
                                        <select name="length" class="form-select">
                                            @foreach ($diameterUnits as $item)
                                                @php
                                                    $selected = '';
                                                    if($preferDiameter == $item->id) $selected = 'selected';
                                                @endphp
                                                <option value="{{$item->id}}" {{$selected}}>{{$item->name}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-6 mx-auto">
                                <div class="btn-group-custom">
                                    <button type="button" class="btn btn-info m-3">Back</button>
                                    <button type="submit" class="btn btn-primary m-3">Save</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection
