<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Controller;
use App\Models\Drillstring;
use App\Models\Surfpiping;
use App\Models\WellBore;
use App\Models\WellInfo;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class WellboreController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    protected $module = 'Wellbore';
    public function index()
    {
        //
        $selectedProjectId = Session::get('projectId');
        $drillstring = Drillstring::where('ProjectID', $selectedProjectId)->get();
        $surfPiping = Surfpiping::where('ProjectID', $selectedProjectId)->get();
        $wellboreInfo = WellBore::where('ProjectID', $selectedProjectId)->first();
        $wellbore = $this->wellboreProcess($wellboreInfo);
        $rigType = WellInfo::where('ProjectID', $selectedProjectId)->first()->rigtype;
        if(!Session::has('selectedDrillString') || !Session::has('nozzles')){
            $selectedDrillString = Drillstring::where('DS_ID', 1)->first();
            Session::put('selectedDrillString', $selectedDrillString);
            $nozzles = DB::table('nozzle')->where('DS_ID', 1)->get();
            Session::put('nozzles', $nozzles);
        }   

        if (Auth::user()->role == 1) {
            return view('Backend.Wellbore.index')->with('module', $this->module)
                ->with('wellbore', $wellbore)
                ->with('drillstring', $drillstring)
                ->with('surfpiping', $surfPiping)
                ->with('rigType', $rigType);
        }else {
            return view('Frontend.Wellbore.index')->with('module', $this->module)
                ->with('wellbore', $wellbore)
                ->with('drillstring', $drillstring)
                ->with('surfpiping', $surfPiping)
                ->with('rigType', $rigType);
        }
    }

    public function wellboreProcess($wellboreCollection){
        $riser = array();
        $csg = array();
        $lfirst = array();
        $lsecond = array();
        $hole = array();
        $collection = array();
        $wellbore = $wellboreCollection->toArray();
        foreach($wellbore as $key => $item){
            if(strpos($key, 'Riser') !== false){
                $riser[$key] = $item;
            }elseif (strpos($key, 'Csg') !== false) {
                $csg[$key] = $item;
            }elseif (strpos($key, 'L1') !== false) {
                $lfirst[$key] = $item;
            }elseif (strpos($key, 'L2') !== false) {
                $lsecond[$key] = $item;
            }elseif (strpos($key, 'Hole') !== false) {
                $hole[$key] = $item;
            }
        }
        $collection = [
            'riser' => $riser,
            'csg' => $csg,
            'lfirst' => $lfirst,
            'lsecond' => $lsecond,
            'hole' => $hole,
        ];
        $collection = json_decode(json_encode($collection));
        return $collection;
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
    public function drillStringUpdate(Request $request)
    {
        DB::table('drillstring')->where('DS_ID', $request->ds_id)->update([
            'Bit_type' => $request->bit_type,
            'Bit_position' => $request->position,
            'Bit_size' => $request->size,
            'Bit_TFA' => $request->tfa,
        ]);

        $drillstring = DB::table('drillstring')->where('DS_ID', $request->ds_id)->first();
        Session::put('selectedDrillString', $drillstring);

        return 1;
    }

    

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\WellBore  $wellBore
     * @return \Illuminate\Http\Response
     */
    public function show(WellBore $wellBore)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\WellBore  $wellBore
     * @return \Illuminate\Http\Response
     */
    public function edit(WellBore $wellBore)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\WellBore  $wellBore
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, WellBore $wellBore)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\WellBore  $wellBore
     * @return \Illuminate\Http\Response
     */
    public function destroy(WellBore $wellBore)
    {
        //
    }
}
