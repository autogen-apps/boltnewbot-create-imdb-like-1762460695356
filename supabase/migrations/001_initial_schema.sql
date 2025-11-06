-- Create movies table
CREATE TABLE movies (
  id SERIAL PRIMARY KEY,
  title VARCHAR NOT NULL,
  description TEXT NOT NULL,
  rating FLOAT,
  trailer_url VARCHAR,
  created_at TIMESTAMP DEFAULT now()
);

-- Create reviews table
CREATE TABLE reviews (
  id SERIAL PRIMARY KEY,
  movie_id INTEGER REFERENCES movies(id) ON DELETE CASCADE,
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
  review TEXT NOT NULL,
  rating INTEGER,
  created_at TIMESTAMP DEFAULT now()
);

-- Row Level Security
ALTER TABLE movies ENABLE ROW LEVEL SECURITY;
ALTER TABLE reviews ENABLE ROW LEVEL SECURITY;

-- Policies for movies
CREATE POLICY "Allow all users to select movies"
  ON movies
  FOR SELECT
  USING (true);

-- Policies for reviews
CREATE POLICY "Allow users to insert reviews"
  ON reviews
  FOR INSERT
  USING (auth.uid() IS NOT NULL);
CREATE POLICY "Allow users to select their reviews"
  ON reviews
  FOR SELECT
  USING (user_id = auth.uid());