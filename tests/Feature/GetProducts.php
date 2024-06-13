<?php

namespace Tests\Feature;

// use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;
use App\Models\Product;

class ExampleTest extends TestCase
{
    /**
     * A basic test example.
     */
    public function test_the_application_returns_a_successful_response(): void
    {
        //Product::factory()->count(3)->create();

        // Gửi yêu cầu GET đến route lấy danh sách sản phẩm
        $response = $this->get('/shop');

        // Kiểm tra xem phản hồi có thành công không
        $response->assertStatus(200);

        // Kiểm tra xem dữ liệu trả về có đúng 9 sản phẩm không
        $response->assertViewHas('products', function ($products) {
            return $products->count() === 9;
        });

    }
}
