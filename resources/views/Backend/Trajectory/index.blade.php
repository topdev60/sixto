@extends('Backend.layouts.app')
@section('content')
<section class="home-section" id="home-section">
    <div class="container-fluid">
        {{---title---}}
        <div class="d-flex align-items-center justify-content-between mb-3">
            <div class="h4 mb-0">
                {{$module}}
            </div>
            <a class="btn btn-secondary" id="switchCharts"> Switch 2D/3D {{$module}} </a>
        </div>
        {{---title---}}
        <div class="row gy-4">
            <div class="col-md-12 col-lg-6">
                <div class="card">
                    <div class="card-header">
                        <div class="float-start">{{__('Survey Points')}}</div>
                        <div class="float-start dropdown" style="margin-left: 70%">
                            <button type="button" role="button" class="btn btn-primary p-0" data-bs-toggle="dropdown"><i class="fas fa-cog"></i></button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#"> {{__('Paste from Clipboard')}} </a></li>
                                <li><a class="dropdown-item" href="#"> {{__('Copy to Clipboard')}} </a></li>
                                <li><a class="dropdown-item" href="{{route('admin.survey.deleteAllRows', session()->get('projectId'))}}"> {{__('Delete All Rows')}} </a></li>
                            </ul>
                        </div>
                        <div class="float-end"><button type="button" data-bs-toggle="modal" data-bs-target="#addTrajectoryModal" class="btn btn-primary p-0"><i class="fas fa-plus"></i> Add</button></div>
                    </div>
                    <div class="card-body overflow-auto clearfix">
                        <table id="dataTable" class="table table-responsive">
                            <thead>
                                <tr>
                                    <th class="text-center">{{__('MD')}}</th>
                                    <th class="text-center">{{__('INC')}}</th>
                                    <th class="text-center">{{__('AZI')}}</th>
                                    <th class="text-center">{{__('TVD')}}</th>
                                    <th class="text-center">{{__('NORTH')}}</th>
                                    <th class="text-center">{{__('EAST')}}</th>
                                    <th class="text-center">{{__('ACTION')}}</th>
                                </tr>
                                <tr>
                                @php
                                    $unitLenID = session()->get('unitLenID');
                                    $unitLenValue = session()->get('unitLenValue');
                                @endphp
                                    <form action="{{route('survey.setunit')}}" method="post" id="selectSurveyUnitForm">
                                    @csrf
                                        <th class="text-center">
                                            <select name="length" class="setUnitForSurvey">
                                                @foreach ($lengthUnits as $item)
                                                    @php
                                                        $selected = '';
                                                        if(isset($unitLenID))
                                                            if($item->id == $unitLenID) $selected = 'selected';
                                                    @endphp
                                                    <option value="{{$item->id}}" {{$selected}}>{{$item->name}}</option>
                                                @endforeach
                                            </select>
                                        </th>
                                        <th class="text-center">{{__('deg')}}</th>
                                        <th class="text-center">{{__('deg')}}</th>
                                        <th class="text-center"><select name="lengtha" class="setUnitForSurvey">
                                                @foreach ($lengthUnits as $item)
                                                    @php
                                                        $selected = '';
                                                        if(isset($unitLenID))
                                                            if($item->id == $unitLenID) $selected = 'selected';
                                                    @endphp
                                                    <option value="{{$item->id}}" {{$selected}}>{{$item->name}}</option>
                                                @endforeach
                                            </select></th>
                                        <th class="text-center"><select name="lengtha" class="setUnitForSurvey">
                                                @foreach ($lengthUnits as $item)
                                                    @php
                                                        $selected = '';
                                                        if(isset($unitLenID))
                                                            if($item->id == $unitLenID) $selected = 'selected';
                                                    @endphp
                                                    <option value="{{$item->id}}" {{$selected}}>{{$item->name}}</option>
                                                @endforeach
                                            </select></th>
                                        <th class="text-center"><select name="lengtha" class="setUnitForSurvey">
                                                @foreach ($lengthUnits as $item)
                                                    @php
                                                        $selected = '';
                                                        if(isset($unitLenID))
                                                            if($item->id == $unitLenID) $selected = 'selected';
                                                    @endphp
                                                    <option value="{{$item->id}}" {{$selected}}>{{$item->name}}</option>
                                                @endforeach
                                            </select></th>
                                        <th class="text-center">{{__(' ')}}</th>
                                    </form>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($trajectories as $traj)
                                    <tr>
                                        <td class="text-center"> @if(isset($unitLenValue)) {{$traj->MD * $unitLenValue}} @else {{$traj->MD}} @endif</td>
                                        <td class="text-center"> {{$traj->Inc}} </td>
                                        <td class="text-center"> {{$traj->Azimuth}} </td>
                                        <td class="text-center"> @if(isset($unitLenValue)) {{ $traj->TVD * $unitLenValue}} @else {{$traj->TVD}} @endif</td>
                                        <td class="text-center"> @if(isset($unitLenValue)) {{ $traj->North * $unitLenValue}} @else {{$traj->North}} @endif</td>
                                        <td class="text-center"> @if(isset($unitLenValue)) {{ $traj->East * $unitLenValue}} @else  {{$traj->East}} @endif</td>
                                        <td class="text-center"><button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#deleteTrajectoryModal{{$traj->id}}"><i class="fas fa-minus"></i></button></td>
                                        <div class="modal fade" id="deleteTrajectoryModal{{ $traj->id }}" data-bs-backdrop="static"
                                            data-bs-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="modelTitleId"
                                            aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <div class="modal-body">
                                            <form action="{{ route('admin.survey.destroy') }}" method="post" id="deleteTrajectory{{ $traj->id }}">
                                                    @csrf
                                                    <input type="hidden" name="id" value="{{ $traj->id }}">
                                                    <div class="p-4 text-center">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="56" height="56" fill="currentColor"
                                                        class="bi bi-exclamation-circle text-danger" viewBox="0 0 16 16">
                                                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                                                        <path
                                                        d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z" />
                                                    </svg>
                                                    <div class="h3 text-danger mt-3">Are you sure?</div>
                                                    <p class="mb-4">
                                                        You will lose this trajectory in {{session()->get('projectName')}}
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
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <div class="float-end">
                            {{ $trajectories->links() }}
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12 col-lg-6">
                <div id="divplot"></div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="addTrajectoryModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="addModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <form action="{{ route('admin.survey.store') }}" method="post">
                @csrf
                <div class="modal-header">
                    <h5 class="modal-title" id="addModalLabel">+ Add {{ __('$module') }}</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row gy-3">
                    <div class="col-md-6">
                        <label for="" class="form-label">MD</label>
                        <input type="text" class="form-control" name="md" required>
                    </div>
                    <div class="col-md-6">
                        <label for="" class="form-label">Inc</label>
                        <input type="text" class="form-control" name="inc" required>
                    </div>
                    <div class="col-md-6">
                        <label for="" class="form-label">Azimuth</label>
                        <input type="text" class="form-control" name="azi" required>
                    </div>
                    <div class="col-md-6">
                        <label for="" class="form-label">TVD</label>
                        <input type="text" class="form-control" name="tvd" required>
                    </div>
                    <div class="col-md-6">
                        <label for="" class="form-label">North</label>
                        <input type="text" class="form-control" name="north" required>
                    </div>
                    <div class="col-md-6">
                        <label for="" class="form-label">EST</label>
                        <input type="text" class="form-control" name="east" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
                </form>
            </div>
        </div>
    </div>
</section>
@endsection
