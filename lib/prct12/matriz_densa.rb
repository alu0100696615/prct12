require "prct12/matriz"

module Prct12

#Matriz Densa hereda de matriz
class MatrizDensa < Matriz
  
  def initialize(fils, cols)
    super(fils, cols)
    @container = Array.new(fils){ Array.new(cols, zero) }
  end
  
  #Modifica el numero de filas
  def filas=(value)
    validate_sizes(value)

    if value > filas
      (value - filas).times { @container << Array.new(columnas, zero) }
    elsif value < filas
      @container.slice!(-1, filas - value)
    end

    filas = value
  end

  #Modifica el numero de columnas
  def columnas=(value)
    validate_sizes(value)

    if value != columnas
      @container.each do |x|
        if value > columnas
          (value - columnas).times { x << zero }
        else
          x.slice!(-1, columnas - value)
        end
      end
    end

    columnas = value
  end

  #Acceso elemento de la matriz 
  def [](fila, columna)
    @container[fila][columna]
  end

  #Asignacion de valor a un elemento
  def []=(fila, columna, valor)
    @container[fila][columna] = valor
  end

end # class

end 