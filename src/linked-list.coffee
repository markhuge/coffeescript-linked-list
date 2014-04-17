class LinkedList
  constructor: ->
    @head = null
    
  add: (data,next) ->
    node = data: data, next: next || null
    cursor = @head or= node

    if @head isnt node
      cursor = cursor.next while cursor.next
      cursor.next = node

    cursor.next || cursor


  get: (position) ->
    position -= 1 
    cursor = @head

    while cursor and position
      cursor = cursor.next
      --position

    cursor.data

  remove: (position) ->
    cursor    = @head
    position -= 1
    
    if position is 0
      @head = cursor.next
    else
      while cursor and position
        [ previous, cursor ] = [ cursor, cursor.next ]
        --position
      previous.next = cursor.next
    return

  size: ->
    cursor   = @head
    counter  = 0

    while cursor
      counter += 1
      cursor = cursor.next
    counter


module.exports = LinkedList