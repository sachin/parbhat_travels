class TryToDeleteNonDeletableEntity < Exception
  def message
    "You are trying to delete a non deletable entity."
  end
end