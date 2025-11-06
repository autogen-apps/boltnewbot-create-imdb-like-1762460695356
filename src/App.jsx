import React from 'react';
import { SupabaseProvider } from './lib/supabase';
import MovieList from './components/MovieList';

const App = () => {
  return (
    <SupabaseProvider>
      <div className="container mx-auto">
        <h1 className="text-3xl font-bold text-center my-5">Movie Discovery App</h1>
        <MovieList />
      </div>
    </SupabaseProvider>
  );
};

export default App;