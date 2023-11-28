<?php
namespace App\Trait;
use App\Models\Category;
use App\Models\Product;
trait VariablesTrait {
    public $categories;
   public  $products;

    public function __construct()
    {
        $this->categories = Category::all();
        $this->products = Product::all();
    }
   // public $commonVar3;

    // You can also include common methods if needed
}
?>
