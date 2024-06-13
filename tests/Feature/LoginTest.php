<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;
use App\Models\User;
use Illuminate\Foundation\Testing\DatabaseTransactions;

class LoginTest extends TestCase
{
    /**
     * A basic feature test example.
     */
   
   // use DatabaseTransactions;

    public function test_example(): void
    {
        $user = User::factory()->create([
            'password' => bcrypt($password = 'i-love-laravel'),
        ]);
    
        $response = $this->post('/login', [
            'email' => $user->email,
            'password' => $password,
        ]);
    
        $this->assertAuthenticated();
       // $response->assertRedirect('/cart');
    }
}
