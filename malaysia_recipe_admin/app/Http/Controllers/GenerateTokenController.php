<?php

namespace App\Http\Controllers;

use Laravel\Sanctum\PersonalAccessTokenFactory;

class GenerateTokenController extends Controller
{
    public function generateToken()
    {
        // Generate a personal access token
        $factory = app(PersonalAccessTokenFactory::class);

        $token = $factory->make(
            'malaysia_recipe', // Replace with your desired token name
            [], // Scopes (empty for unrestricted access)
        );

        // Save the token value in a secure location (e.g., database)
        $tokenValue = $token->plainTextToken;

        return response()->json(['token' => $tokenValue], 200);
    }
}
