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
                    <div class="card-header clearfix">
                        <div class="float-start m-3 mt-0 mb-0">
                            {{'Section'}}
                        </div>
                        <div class="float-start">
                            <select name="selectDrillstring" id="selectDrillstring" class="form-control p-0">
                                @foreach ($drillStrings as $item)
                                    <option value="{{$item->DS_ID}}">{{$item->Description}}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="float-end">
                            <button type="button" class="btn btn-primary p-0" data-bs-toggle="modal"
                                data-bs-target="#addDrillstringModal">
                                + Add
                            </button>
                        </div>
                    </div>
                    <div class="card-body overflow-auto clearfix">
                        <table id="dataTable" class="table table-responsive">
                            <thead>
                                <tr>
                                    <th class="text-center"> {{__('Description')}} </th>
                                    <th class="text-center"> {{__('ID(in)')}} </th>
                                    <th class="text-center"> {{__('OD(in)')}} </th>
                                    <th class="text-center"> {{__('Weight(lb/ft)')}} </th>
                                    <th class="text-center"> {{__('Length(ft)')}} </th>
                                    <th class="text-center"> {{__('TJ(ft)')}} </th>
                                    <th class="text-center"> {{__('Action')}} </th>
                                </tr>
                            </thead>
                            <tbody>
                                {{-- @foreach ($drill as $item)
                                    
                                @endforeach --}}
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection