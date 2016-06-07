# circular_buffer.rb

class CircularBuffer
  attr_accessor :buffer_array, :write_slot, :read_slot
  attr_reader :buffer_size

  def initialize(buffer_size)
    @buffer_array = (1..buffer_size).map { [] }
    @buffer_size = buffer_size
    @write_slot = 0 # variable to keep track of where to write next
    @read_slot = 0 # variable to keep track of where to read next
  end

  def read
    raise BufferEmptyException if empty_buffer?
    return_value = buffer_array[next_read_slot].first
    delete_read_value
    increment_read_buffer_slot
    return_value
  end

  def empty_buffer?
    buffer_array[next_read_slot].empty?
  end

  def delete_read_value
    buffer_array[next_read_slot] = []
  end

  def increment_write_buffer_slot
    self.write_slot += 1
  end

  def increment_read_buffer_slot
    self.read_slot += 1
  end

  def next_read_slot
    read_slot % buffer_size
  end

  def next_write_slot
    write_slot % buffer_size
  end

  def write(value)
    if value
      raise BufferFullException unless buffer_array[next_write_slot].empty?
      buffer_array[next_write_slot] << value
      increment_write_buffer_slot
    end
  end

  def write!(value)
    if value
      increment_read_buffer_slot unless buffer_array[next_write_slot].empty?
      buffer_array[next_write_slot] = []
      buffer_array[next_write_slot] << value
      increment_write_buffer_slot
    end
  end

  def clear
    @buffer_array = (1..buffer_size).map { [] }
    @write_slot = 0
    @read_slot = 0
  end

  class BufferEmptyException < StandardError
  end

  class BufferFullException < StandardError
  end
end
