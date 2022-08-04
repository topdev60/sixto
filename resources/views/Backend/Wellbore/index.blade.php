@extends('Backend.layouts.app')
@section('content')
<section class="home-section" id="home-section">
    <div class="container-fluid">
        <div class="d-flex align-items-center justify-content-between mb-3">
            <div class="h4 mb-0">
                {{$module}}
            </div>
        </div>
        <div class="row gy-4">
            <div class="col-md-12 col-lg-8">
                <div class="card">
                    <div class="card-header">fixed table</div>
                    <div class="card-body overflow-auto clearfix">
                        <table id="dataTable" class="table table-responsive">
                            <thead>
                                <tr>
                                    <th class="text-center">{{__('Description')}}</th>
                                    <th class="text-center">{{__('Top MD(ft)')}}</th>
                                    <th class="text-center">{{__('Bottom MD(ft)')}}</th>
                                    <th class="text-center">{{__('ID(in)')}}</th>
                                    <th class="text-center">{{__('OD(in)')}}</th>
                                    <th class="text-center">{{__('Weight(lbs/ft)')}}</th>
                                    <th class="text-center">{{__('Active')}}</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($wellbore as $item)
                                    <tr>
                                        <td class="text-center">{{__($item->RiserDescription)}}</td>
                                        <td class="text-center">{{__($item->RiserTop)}}</td>
                                        <td class="text-center">{{__($item->RiserBottom)}}</td>
                                        <td class="text-center">{{__($item->RiserID)}}</td>
                                        <td class="text-center">{{__($item->RiserOD)}}</td>
                                        <td class="text-center">{{__($item->RiserWeight)}}</td>
                                        <td class="text-center"><input type="checkbox" @if($item->RiserActive) checked @endif></td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="row mt-4">
                    <div class="col-md-12 col-lg-5">
                        <div class="card">
                            <div class="card-header">{{__('Bit Information')}}</div>
                            <div class="card-body overflow-auto clearfix">
                                <div class="row">
                                    <div class="col-md-12 col-lg-5">
                                        <div>
                                            <label for="type" class="form-label">Type</label>
                                            <select class="form-select">
                                                <option value="0">Roller-Cone</option>
                                                <option value="1">Roller-Cones</option>
                                            </select>
                                            <label for="position" class="form-label">Position</label>
                                            <input type="number" class="form-control" name="position">
                                        </div>
                                    </div>
                                    <div class="col-md-12 col-lg-7">
                                        <table id="dataTable" class="table table-responsive">
                                            <thead>
                                                <tr>
                                                    <th>No. of Nozzles</th>
                                                    <th>Size(1/32 in)</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>3</td>
                                                    <td>32</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="clearfix">
                                    <div class="float-start col-md-4">
                                        <label for="size" class="form-label">Size</label>
                                        <input type="text" class="form-control" name="size">
                                    </div>
                                    <div class="form-check float-start col-md-4 mt-4">
                                        <label for="tfa" class="form-check-label">TFA</label>
                                        <input type="checkbox" class="form-check-input" name="tfa">
                                    </div>
                                    <div class="float-end col-md-4">
                                        <label for="tfa" class="form-label">in^2</label>
                                        <input type="text" class="form-control" name="tfa">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-4">
                        <div class="card">
                            <div class="card-header">{{__('Surface Piping')}}</div>
                            <div class="card-body overflow-auto clearfix">
                                <table id="dataTable" class="table table-responsive">
                                    <thead>
                                        <tr>
                                            <th class="text-center"> {{__('Length(ft)')}} </th>
                                            <th class="text-center"> {{__('ID(in)')}} </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($surfpiping as $item)
                                            <tr>
                                                <td class="text-center"> {{$item->Length}} </td>
                                                <td class="text-center"> {{$item->ID}} </td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-3">
                        <div class="text-center mt-4">
                            <button type="button" class="btn btn-primary">Button 1</button>
                        </div>
                        <div class="text-center mt-2">
                            <button type="button" class="btn btn-primary">Button 1</button>
                        </div>
                        <div class="text-center mt-2">
                            <button type="button" class="btn btn-primary">Button 1</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12 col-lg-4">
                plot
            </div>
        </div>
    </div>
</section>
@endsection