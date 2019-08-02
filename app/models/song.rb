class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_id=(genre)
    self.genre = Genre.find_or_create_by(name: genre)
  end

  def genre_id
    self.genre ? self.genre.name : nil
  end

  def note_contents=(note_entries)
    note_entries.each do |content|
      note = Note.find_or_create_by(content: content)
      self.notes << note
    end
  end

  def note_contents
    binding.pry
    self.notes ? self.notes.content : nil
  end

end
