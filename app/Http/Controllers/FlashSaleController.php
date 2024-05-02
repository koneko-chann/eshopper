<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\FlashSale;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
class FlashSaleController extends Controller
{
    //
    private $flashSale;
    private $actived_flashSale;
    public function __construct(FlashSale $flashSale)
    {
        $this->flashSale = $flashSale;
    }
    
    public function checkAuth(Request $request)
    {
        $user=User::where('email',$request->email)->first();
        if (!$user || !Hash::check($request->password, $user->password)) {
            return response()->json(['message' => 'Unauthorized'], 401);
        }
        $flashSale = $this->flashSale->where('id', $request->id)->where('active', 1)->first();
        if ($flashSale != null && $flashSale->start_at <= now() && $flashSale->end_at >= now()){
            return $user->createToken('device_name')->plainTextToken;
        }
        return response()->json(['active' => false]);
    }
    public function pushActive(Request $request)
    {
        $flashSale = $this->flashSale->where('id', $request->id)->first();
        $actived_flashSale = $this->flashSale->where('active', 1)->get();
        if ($flashSale != null){
            $flashSale->active = 1;
            $flashSale->save();
            return response()->json(['active' => true]);
        }
        return response()->json(['active' => false]);
    }
    public function index()
    {
        $flashSales = $this->flashSale->all();
        $actived_flashSale=$this->flashSale->where('active',1)->first();
        $products=$actived_flashSale->products;
        return view('flashsales.index', compact('actived_flashSale','flashSales','products'));
    }
}
