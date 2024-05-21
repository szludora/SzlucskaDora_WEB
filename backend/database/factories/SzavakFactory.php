<?php

namespace Database\Factories;

use App\Models\Tema;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\szavak>
 */
class SzavakFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            "magyar" => fake('hu_HU')->realText(),
            "angol" => fake('en_EN')->realText(),
            "temaId" => Tema::all()->random(),
        ];
    }
}
