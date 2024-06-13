<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Product>
 */
class ProductFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            //
            // write code
            'user_id'=>$this->faker->randomNumber(1),
            'name' => $this->faker->name,
            'price' => $this->faker->randomNumber(2),
            'category_id' => 12,
            'created_at' => $this->faker->dateTime,
            'updated_at' => $this->faker->dateTime


        ];
    }
}
