resource "layout" "complex" {
  column "sandbox" {
	  # The width of a column or the height of a row can be specified in percentages.
    width = 50

    row "sandbox_top" {
	    # The width and height values can also be interpolated.
      height = 50
    }

    row "sandbox_bottom" {
      height = 50
    }
  }

  column "instructions" {
    width = 50
  }
}