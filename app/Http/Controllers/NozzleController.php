<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Session;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
class NozzleController extends Controller
{
    public function store(Request $request)
    {
        $selectedProjectId = Session::get('projectId');
        $ds_id = $request->ds_id;
        $size = $request->size;
        DB::table('nozzle')->insert([
            'DS_ID' => $ds_id,
            'size' => $size,
        ]);
        return redirect()->back();
    }

    public function update(Request $request)
    {
        $nz_id = $request->nz_id;
        $size = $request->size;

        DB::table('nozzle')->where('NZ_ID', $nz_id)->update([
            'size' => $size,
        ]);

        return redirect()->back();
    }

    public function destroy(Request $request)
    {
        $nz_id = $request->nz_id;
        DB::table('nozzle')->where('NZ_ID', $nz_id)->delete();
        return redirect()->back();
    }
}
