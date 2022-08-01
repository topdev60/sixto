<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Controller;
use App\Models\Survey;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\WellInfo;
use Illuminate\Support\Facades\Session;

use App\Models\Popressure;
use App\Models\Fgpressure;
use App\Models\Temperature;
use App\Models\Lithology;

class ProjectController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    protected $module = 'Projects';
    public function index()
    {
        if(Auth::user()->role == 1){
            $projects = WellInfo::paginate(10);
            return view('Backend.Project.index')->with('projects', $projects)->with('module', $this->module);
        }else {
            $projects = WellInfo::where('UserID', Auth::id())->paginate(10);
            return view('Frontend.Project.index')->with('projects', $projects)->with('module', $this->module);
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        $wellinfo = WellInfo::create([
            'UserID' => Auth::id(),
            'project_name' => $request->name,
            'location' => $request->location,
            'field' => $request->field,
            'lease' => $request->lease,
            'operator' => $request->operation,
            'rigcontroller' => $request->rig_controller,
            'wellname' => $request->well_name,
            'rigname' => $request->rig_name,
            'rigtype' => $request->rig_type,
        ]);
        Survey::insert([
            'ProjectID' => $wellinfo->ProjectID,
            'MD' => 0,
            'Inc' => 0,
            'Azimuth' => 0,
            'TVD' => 0,
            'North' => 0,
            'East' => 0,
        ]);
        if($wellinfo){
            $output = 'Successed Create Project';
        }else {
            $output = 'Failed Create Project';
        }

        return redirect()->back();
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        //
        if(Auth::user()->role == 1){
            $wellinfo = WellInfo::where('ProjectID', $request->id)->update([
                'project_name' => $request->name,
                'location' => $request->location,
                'field' => $request->field,
                'lease' => $request->lease,
                'operator' => $request->operation,
                'rigcontroller' => $request->rig_controller,
                'wellname' => $request->well_name,
                'rigname' => $request->rig_name,
                'rigtype' => $request->rig_type,
            ]);

        }
        $wellinfo = WellInfo::where('UserID', Auth::id())->where('ProjectID', $request->id)->update([
            'project_name' => $request->name,
            'location' => $request->location,
            'field' => $request->field,
            'lease' => $request->lease,
            'operator' => $request->operation,
            'rigcontroller' => $request->rig_controller,
            'wellname' => $request->well_name,
            'rigname' => $request->rig_name,
            'rigtype' => $request->rig_type,
        ]);
        if($wellinfo){
            $output = 'Successed Create Project';
        }else {
            $output = 'Failed Create Project';
        }

        return redirect()->back();
    }

    /**
     *
     * @param int $ProjectID
     *
     */

    public function selectproject($id){
        $project = WellInfo::where('projectID',$id)->first();
        $projectName = $project->project_name;
        Session::put('projectId', $id);
        Session::put('projectName', $projectName);
        return redirect()->back();
    }

    public function getChartsData(Request $request) {
        $selectedProjectId = $request->projectId;
        $chartDataType = $request->chartDataType;
        if ($chartDataType == 0) {
            $x = [];$y = [];$z = [];
            $trajectories = Survey::where('ProjectID', $selectedProjectId)->get();
            foreach ($trajectories as $key => $traj) {
                array_push($x, $traj->TVD);
                array_push($y, $traj->North);
                array_push($z, $traj->East);
            }
        }elseif ($chartDataType == 1) {
            $x = [];$y = [];$z = [];
            $porepressure = Popressure::where('ProjectID', $selectedProjectId)->get();
            foreach ($porepressure as $key => $traj) {
                array_push($x, $traj->TVD);
                array_push($y, $traj->PP);
                array_push($z, $traj->Pressure);
            }
        }elseif ($chartDataType == 2) {
            $x = [];$y = [];$z = [];
            $fgpressure = Fgpressure::where('ProjectID', $selectedProjectId)->get();
            foreach ($fgpressure as $key => $traj) {
                array_push($x, $traj->TVD);
                array_push($y, $traj->FG);
                array_push($z, $traj->Pressure);
            }
        }elseif ($chartDataType == 3) {
            $x = [];$y = [];$z = [];
            $temperatures = Temperature::where('ProjectID', $selectedProjectId)->get();
            foreach ($temperatures as $key => $traj) {
                array_push($x, $traj->TVD);
                array_push($y, $traj->TG);
                array_push($z, $traj->Temperature);
            }
        }elseif ($chartDataType == 4) {
            $x = [];$y = [];$z = [];
            $lithologies = Lithology::where('ProjectID', $selectedProjectId)->paginate(10);
            foreach ($lithologies as $key => $traj) {
                array_push($x, $traj->TVD);
                array_push($y, $traj->TC);
                array_push($z, $traj->SH);
            }
        }
        $data = [
            'x' => $x,
            'y' => $y,
            'z' => $z
        ];
        return response()->json($data);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        if(Auth::user()->role == 1){
            WellInfo::where('ProjectID', $request->id)->delete();
            Survey::where('ProjectID', $request->id)->delete();
        }else {
            WellInfo::where('UserID', Auth::id())->where('ProjectID', $request->id)->delete();
            Survey::where('ProjectID', $request->id)->delete();
        }
        Session::forget('projectId');
        Session::forget('projectName');
        return redirect()->back();
    }
}
