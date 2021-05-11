# frozen_string_literal: true

Crystal.destroy_all

Crystal.create([
  { kind: 'Amethyst', color: 'purple', shiny: false, dopeness: 5000 },
  { kind: 'Ruby', color: 'red', shiny: true, dopeness: 9000 },
  { kind: 'Pearl', color: 'white', shiny: false, dopeness: 9001 }
])
