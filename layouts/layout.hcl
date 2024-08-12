resource "layout" "minimal" {
  column "main" {
  }
}

resource "layout" "complex" {
  column "left" {
	  # The width of a column or the height of a row can be specified either in
	  # percentages or pixels.
    width = "50%"

    row "top_left" {
	    # The width and height values can also be interpolated.
      height = "${216/2}px"
    }

    row "bottom_left" {
      height = 50
    }
  }

  column "right" {
    width = 50
  }
}

output "minimal" {
  value = resource.layout.minimal
}

output "complex" {
  value = resource.layout.complex
}