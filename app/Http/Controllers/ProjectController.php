<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Controller;
use App\Models\Survey;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\WellInfo;
use Illuminate\Support\Facades\Session;

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
            $projects = WellInfo::all();
            return view('Backend.Project.index')->with('projects', $projects)->with('module', $this->module);
        }else {
            $projects = WellInfo::where('UserID', Auth::id())->get();
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
        $trajectories = Survey::where('ProjectID', $selectedProjectId)->get();
        $tvd = [];
        $north = [];
        foreach ($trajectories as $key => $traj) {
            array_push($tvd, $traj->TVD);
            array_push($north, $traj->North);
        }
        $data = [
            'x' => $north,
            'y' => $tvd
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
