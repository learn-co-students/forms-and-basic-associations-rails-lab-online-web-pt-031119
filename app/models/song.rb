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
      if content.present?
        note = Note.find_or_create_by(content: content)
        self.notes << note
      end
    end
  end

  def note_contents
    self.notes.map do |entries|
      entries.content
    end
  end

  def genre_name=(genre)
    self.genre = Genre.find_or_create_by(name: genre)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

end
