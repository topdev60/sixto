@extends('Backend.layouts.app')
@section('content')
<input type="hidden" id="tabType" value="5">
<input type="hidden" name="selectedSampleID" value="{{session()->get('selectedSampleID')}}">
<section class="home-section" id="home-section">
    <div class="container-fluid">
        <div class="d-flex align-items-center justify-content-between mb-3">
            <div class="h4 mb-0">
                {{$module}}
            </div>
        </div>
        @php
            $typeList       = ['Oil Based', 'SOB-Mineral Oil', 'SOB-Oleofin', 'SOB-Paraffin', 'Water Based', 'W.B.-CaCl'];
            $rheologyList   = ['Newtonian', 'Bingham Plastic', 'Power Law', 'Herschel Bulkley', 'API RP 13D'];

            if (session()->has('fluidInfo')) {
                $fluidInfo = session()->get('fluidInfo');
            };
            if (session()->has('selectedSampleID')) {
                $selectedSampleID = session()->get('selectedSampleID');
            };
        @endphp
        <div class="row gy-4">
            <div class="col-md-12 col-lg-12">
                <div class="card">
                    <div class="card-header clearfix">
                        <div class="float-start m-2">
                            {{'Fluids'}}
                        </div>
                        <div class="float-start">
                            {{session()->get('fluidName')}}
                        </div>
                        <div class="float-start dropdown" style="margin-left: 81%">
                            <button type="button" role="button" class="btn btn-primary p-0 mt-1" data-bs-toggle="dropdown"><i class="fas fa-cog"></i></button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="javascript:void(0)" onclick="pasteFluidFunc()"> {{__('Paste from Clipboard')}} </a></li>
                                <li><a class="dropdown-item" href="{{route('admin.fluids.export', session()->get('fluidId'))}}"> {{__('Export to Excel')}} </a></li>
                                <li><a class="dropdown-item" href="{{route('admin.fluids.deleteAllRows', session()->get('projectId'))}}"> {{__('Delete All Rows')}} </a></li>
                            </ul>
                        </div>
                        <div class="float-end">
                            <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#addFluidModal"> +Add {{$module}} </button>
                        </div>
                    </div>
                    <div class="card-body overflow-auto clearfix">
                        <table id="dataTable" class="table table-responsive">
                            <thead>
                                <tr>
                                    <th class="text-center"><i class="fas fa-grip-vertical"></i></th>
                                    <th class="text-center">#</th>
                                    <th class="text-center">{{__('Description')}}</th>
                                    <th class="text-center">{{__('Density')}}</th>
                                    <th class="text-center">{{__('Type')}}</th>
                                    <th class="text-center">{{__('Rheology')}}</th>
                                    <th class="text-center">{{__('YP')}}</th>
                                    <th class="text-center">{{__('PV')}}</th>
                                    <th class="text-center">{{__('K')}}</th>
                                    <th class="text-center">{{__('n')}}</th>
                                    <th class="text-center">{{__('Viscosity')}}</th>
                                    <th class="text-center">{{__('Oil')}}</th>
                                    <th class="text-center">{{__('Water')}}</th>
                                    <th class="text-center">{{__('TC')}}</th>
                                    <th class="text-center">{{__('SH')}}</th>
                                    <th class="text-center">{{__('Action')}}</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($fluids as $item)
                                    <tr>
                                        <td class="text-center">
                                            <a href="{{route('admin.fluid.select', $item->FluidID)}}">
                                                @if (session()->get('fluidId') == $item->FluidID)
                                                    <i class="far fa-check-square"></i>
                                                @else
                                                    <i class="far fa-square"></i>
                                                @endif
                                            </a>
                                        </td>
                                        <td class="text-center">{{$loop->iteration}}</td>
                                        <td class="text-center">{{$item->Description}}</td>
                                        <td class="text-center">{{$item->Density}}</td>
                                        <td class="text-center">{{$typeList[$item->Type]}}</td>
                                        <td class="text-center">{{$rheologyList[$item->Rheology]}}</td>
                                        <td class="text-center">{{$item->YP}}</td>
                                        <td class="text-center">{{$item->PV}}</td>
                                        <td class="text-center">{{$item->K}}</td>
                                        <td class="text-center">{{$item->n}}</td>
                                        <td class="text-center">{{$item->Viscosity}}</td>
                                        <td class="text-center">{{$item->Oil}}</td>
                                        <td class="text-center">{{$item->Water}}</td>
                                        <td class="text-center">{{$item->TC}}</td>
                                        <td class="text-center">{{$item->SH}}</td>
                                        <td class="text-center">
                                            <div class="btn-group" role="group" aria-label="Basic example">
                                                <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                                  data-bs-target="#deleteFluidModal{{$item->FluidID}}">
                                                  <i class="fas fa-trash"></i>
                                                </button>
                                                <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                                  data-bs-target="#editFluidModal{{$item->FluidID}}">
                                                  <i class="fas fa-pencil-alt"></i>
                                                </button>
                                            </div>
                                            {{-- delete modal --}}
                                            <div class="modal fade" id="deleteFluidModal{{ $item->FluidID }}" data-bs-backdrop="static"
                                                data-bs-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="modelTitleId"
                                                aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-body">
                                                    <form action="{{ route('admin.fluid.destroy') }}" method="post" id="delete{{ $item->FluidID }}">
                                                        @csrf
                                                        <input type="hidden" name="FluidID" value="{{ $item->FluidID }}">
                                                        <div class="p-4 text-center">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="56" height="56" fill="currentColor"
                                                            class="bi bi-exclamation-circle text-danger" viewBox="0 0 16 16">
                                                            <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                                                            <path
                                                            d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z" />
                                                        </svg>
                                                        <div class="h3 text-danger mt-3">Are you sure?</div>
                                                        <p class="mb-4">
                                                            You will lose all data that is related to this project
                                                        </p>
                                                        <div class="d-flex align-items-center justify-content-center">
                                                            <button type="button" class="btn btn-success me-4 px-5"
                                                            data-bs-dismiss="modal">No</button>
                                                            <button type="submit" class="btn btn-danger px-5">Yes</button>
                                                        </div>
                                                        </div>
                                                    </form>
                                                    </div>
                                                </div>
                                                </div>
                                            </div>
                                            {{-- delete modal --}}
                                            {{-- edit modal --}}
                                            <div class="modal fade" id="editFluidModal{{ $item->FluidID }}" data-bs-backdrop="static"
                                                data-bs-keyboard="false" tabindex="-1" aria-labelledby="editFluidModalLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered modal-lg">
                                                <div class="modal-content">
                                                    <form action="{{ route('admin.fluid.update') }}" method="post">
                                                    @csrf
                                                    <input type="hidden" name="FluidID" value="{{ $item->FluidID }}">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="editModalLabel">Edit {{ __('Fluid') }}</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="row gy-3">
                                                        <div class="col-md-6">
                                                            <label for="" class="form-label">Description</label>
                                                            <input type="text" class="form-control" name="description" value="{{ $item->Description }}"
                                                            required>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label for="" class="form-label">Density</label>
                                                            <input type="text" class="form-control" name="density" value="{{ $item->Density }}"
                                                            required>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label for="" class="form-label">Type</label>
                                                            <select class="form-control" name="type"
                                                            required>
                                                                @foreach ($typeList as $key => $list)
                                                                    @php
                                                                        $selected = '';
                                                                        if($key == $item->Type) $selected = 'selected';
                                                                    @endphp
                                                                    <option value="{{$key}}" {{$selected}}>{{$list}}</option>
                                                                @endforeach
                                                            </select>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label for="" class="form-label">Rheology</label>
                                                            <select class="form-control" name="rheology"
                                                                required>
                                                                    @foreach ($rheologyList as $key => $list)
                                                                        @php
                                                                            $selected = '';
                                                                            if($key == $item->Rheology) $selected = 'selected';
                                                                        @endphp
                                                                        <option value="{{$key}}" {{$selected}}>{{$list}}</option>
                                                                    @endforeach
                                                                </select>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label for="" class="form-label">YP</label>
                                                            <input type="text" class="form-control" name="yp"
                                                            value="{{ $item->YP }}" required>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label for="" class="form-label">PV</label>
                                                            <input type="text" class="form-control" name="pv" value="{{ $item->PV }}"
                                                            required>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label for="" class="form-label">K</label>
                                                            <input type="text" class="form-control" name="k" value="{{$item->K}}" required>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label for="" class="form-label">n</label>
                                                            <input type="text" class="form-control" name="n"
                                                            value="{{ $item->n }}" required>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label for="" class="form-label">Viscosity</label>
                                                            <input type="text" class="form-control" name="viscosity"
                                                            value="{{ $item->Viscosity }}" required>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label for="" class="form-label">Oil</label>
                                                            <input type="text" class="form-control" name="oil"
                                                            value="{{ $item->Oil }}" required>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label for="" class="form-label">Water</label>
                                                            <input type="text" class="form-control" name="water"
                                                            value="{{ $item->Water }}" required>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label for="" class="form-label">TC</label>
                                                            <input type="text" class="form-control" name="tc"
                                                            value="{{ $item->TC }}" required>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <label for="" class="form-label">SH</label>
                                                            <input type="text" class="form-control" name="sh"
                                                            value="{{ $item->SH }}" required>
                                                        </div>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="submit" class="btn btn-primary">Submit</button>
                                                    </div>
                                                    </form>
                                                </div>
                                                </div>
                                            </div>
                                            {{-- edit modal --}}
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="row mt-4">
                    <div class="col-md-12 col-lg-6">
                        <div class="card">
                            <div class="card-header">
                                <div class="float-start m-t-1">{{'Rheometer Values'}}</div>
                                <div class="float-start m-r-10 m-t-1">
                                    <button type="button" class="btn btn-primary p-0" data-bs-toggle="modal"
                                    data-bs-target="#addSampleModal">
                                    + Add
                                  </button>
                                </div>
                                <div class="float-end">
                                    <div class="row g-3 align-items-center">
                                        <div class="col-auto">
                                            <label for="selectSample">Select Sample</label>
                                        </div>
                                        <div class="col-auto">
                                            <select name="selectedSample" class="form-select" id="selectSample">
                                                @isset($fluidInfo)
                                                    @foreach ($fluidInfo->sample as $key => $item)
                                                        @php
                                                            $selected = "";
                                                            if(isset($selectedSampleID)){
                                                                if ($item->SampleID == $selectedSampleID) {
                                                                    $selected = "selected";
                                                                }
                                                            }else {
                                                                if ($key == 0) {
                                                                    $selected = "selected";
                                                                }
                                                            }
                                                        @endphp
                                                        <option value="{{$item->SampleID}}" {{$selected}}>{{$loop->iteration}}</option>
                                                    @endforeach
                                                @endisset
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body overflow-auto clearfix" id="sampleWrapper">
                                @isset($fluidInfo)
                                    @foreach ($fluidInfo->sample as $key => $item)
                                        <form action="{{route('admin.sample.update')}}" method="POST" id="selectSampleForm">
                                            @csrf
                                            @php
                                                $style = "";
                                                if (isset($selectedSampleID)) {
                                                    if ($item->SampleID != $selectedSampleID) {
                                                        $style = "display:none";
                                                    }
                                                }else {
                                                    if ($key != 0) {
                                                        $style = "display:none";
                                                    }
                                                }
                                            @endphp
                                            <div class="row sample" id="sample{{$item->SampleID}}" style="{{$style}}">
                                                <input type="hidden" name="SampleID" value="{{$item->SampleID}}">
                                                <input type="hidden" name="FluidId" value="{{session()->get('fluidId')}}">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="Pressure">Pressure</label>
                                                        <input type="text" class="form-control" name="pressure" value="{{$item->Pressure}}">
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="Pressure">Temperature</label>
                                                        <input type="text" class="form-control" name="temperature" value="{{$item->Temperature}}">
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <table id="dataTable" class="table table-responsive">
                                                        <thead>
                                                            <tr>
                                                                <th class="text-center col-md-4">Speed(rpm)</td>
                                                                <th class="text-center col-md-8">Fann(Reading)</td>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td class="text-center col-md-4">{{'3'}}</td>
                                                                <td class="text-center col-md-8"><input type="text" class="form-control" name="r_3" value="{{$item->R3}}"></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="text-center col-md-4">{{'6'}}</td>
                                                                <td class="text-center col-md-8"><input type="text" class="form-control" name="r_6" value="{{$item->R6}}"></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="text-center col-md-4">{{'30'}}</td>
                                                                <td class="text-center col-md-8"><input type="text" class="form-control" name="r_30" value="{{$item->R30}}"></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="text-center col-md-4">{{'60'}}</td>
                                                                <td class="text-center col-md-8"><input type="text" class="form-control" name="r_60" value="{{$item->R60}}"></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="text-center col-md-4">{{'100'}}</td>
                                                                <td class="text-center col-md-8"><input type="text" class="form-control" name="r_100" value="{{$item->R100}}"></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="text-center col-md-4">{{'200'}}</td>
                                                                <td class="text-center col-md-8"><input type="text" class="form-control" name="r_200" value="{{$item->R200}}"></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="text-center col-md-4">{{'300'}}</td>
                                                                <td class="text-center col-md-8"><input type="text" class="form-control" name="r_300" value="{{$item->R300}}"></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="text-center col-md-4">{{'600'}}</td>
                                                                <td class="text-center col-md-8"><input type="text" class="form-control" name="r_600" value="{{$item->R600}}"></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <button type="submit" class="btn btn-primary">{{__('Update')}}</button>
                                            </div>
                                        </form>
                                    @endforeach
                                @endisset
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-6">
                        <div id="divplot"></div>
                    </div>
                    {{-- <div class="col-md-12 col-lg-3">
                        <div class="card">
                            <div class="card-header">Selection Area</div>
                            <div class="card-body overflow-auto clearfix">Body</div>
                        </div>
                    </div> --}}
                    {{-- <div class="col-md-12 col-lg-3">
                        <button class="btn btn-primary mt-4">Update</button>
                    </div> --}}
                </div>
            </div>
        </div>
    </div>
</section>
{{-----Start Add Fluid Modal------}}
<div class="modal fade" id="addFluidModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="addModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <form action="{{ route('admin.fluid.store') }}" method="post">
                @csrf
                <div class="modal-header">
                    <h5 class="modal-title" id="addFluidModalLabel">+ Add {{ __('Fluid') }}</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row gy-3">
                    <div class="col-md-6">
                        <label for="" class="form-label">Description</label>
                        <input type="text" class="form-control" name="description"
                        required>
                    </div>
                    <div class="col-md-6">
                        <label for="" class="form-label">Density</label>
                        <input type="text" class="form-control" name="density"
                        required>
                    </div>
                    <div class="col-md-6">
                        <label for="" class="form-label">Type</label>
                        <select class="form-control" name="type"
                        required>
                            @foreach ($typeList as $key => $list)
                                <option value="{{$key}}">{{$list}}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-md-6">
                        <label for="" class="form-label">Rheology</label>
                        <select class="form-control" name="rheology"
                            required>
                                @foreach ($rheologyList as $key => $list)
                                    <option value="{{$key}}">{{$list}}</option>
                                @endforeach
                            </select>
                    </div>
                    <div class="col-md-6">
                        <label for="" class="form-label">YP</label>
                        <input type="text" class="form-control" name="yp"
                        required>
                    </div>
                    <div class="col-md-6">
                        <label for="" class="form-label">PV</label>
                        <input type="text" class="form-control" name="pv" required>
                    </div>
                    <div class="col-md-6">
                        <label for="" class="form-label">K</label>
                        <input type="text" class="form-control" name="k" required>
                    </div>
                    <div class="col-md-6">
                        <label for="" class="form-label">n</label>
                        <input type="text" class="form-control" name="n"
                        required>
                    </div>
                    <div class="col-md-6">
                        <label for="" class="form-label">Viscosity</label>
                        <input type="text" class="form-control" name="viscosity"
                        required>
                    </div>
                    <div class="col-md-6">
                        <label for="" class="form-label">Oil</label>
                        <input type="text" class="form-control" name="oil"
                        required>
                    </div>
                    <div class="col-md-6">
                        <label for="" class="form-label">Water</label>
                        <input type="text" class="form-control" name="water"
                        required>
                    </div>
                    <div class="col-md-6">
                        <label for="" class="form-label">TC</label>
                        <input type="text" class="form-control" name="tc"
                        required>
                    </div>
                    <div class="col-md-12">
                        <label for="" class="form-label">SH</label>
                        <input type="text" class="form-control" name="sh"
                        required>
                    </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </form>
        </div>
    </div>
</div>
{{-----End Add Fluid Modal------}}

{{-----Start Add Sample Modal-----}}
<div class="modal fade" id="addSampleModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="addModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <form action="{{ route('admin.sample.store') }}" method="post">
            <input type="hidden" name="FluidID" value="{{session()->get('fluidId')}}">
            @csrf
            <div class="modal-header">
                <h5 class="modal-title" id="addFluidModalLabel">+ Add {{ __('Sample') }}</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row gy-3">
                    <div class="col-md-6">
                        <label for="" class="form-label">Pressure</label>
                        <input type="text" class="form-control" name="pressure"
                        required>
                    </div>
                    <div class="col-md-6">
                        <label for="" class="form-label">Temperature</label>
                        <input type="text" class="form-control" name="temperature"
                        required>
                    </div>
                    <div class="col-md-6">
                        <label for="" class="form-label">R3</label>
                        <input type="text" class="form-control" name="r_3"
                        required>
                    </div>
                    <div class="col-md-6">
                        <label for="" class="form-label">R6</label>
                        <input type="text" class="form-control" name="r_6"
                        required>
                    </div>
                    <div class="col-md-6">
                        <label for="" class="form-label">R30</label>
                        <input type="text" class="form-control" name="r_30"
                        required>
                    </div>
                    <div class="col-md-6">
                        <label for="" class="form-label">R60</label>
                        <input type="text" class="form-control" name="r_60"
                        required>
                    </div>
                    <div class="col-md-6">
                        <label for="" class="form-label">R100</label>
                        <input type="text" class="form-control" name="r_100"
                        required>
                    </div>
                    <div class="col-md-6">
                        <label for="" class="form-label">R200</label>
                        <input type="text" class="form-control" name="r_200" required>
                    </div>
                    <div class="col-md-6">
                        <label for="" class="form-label">R300</label>
                        <input type="text" class="form-control" name="r_300" required>
                    </div>
                    <div class="col-md-6">
                        <label for="" class="form-label">R600</label>
                        <input type="text" class="form-control" name="r_600"
                        required>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
            </form>
        </div>
    </div>
</div>
{{-----End Add Sample Modal-----}}
@endsection
