resource "layout" "stress" {
  column "left" {
    width = 25

    row "left_top" {
      height = 50
    }

    row "left_bottom" {
      height = 50

      column "left_bottom_left" {
        width = 50
      }

      column "left_bottom_right" {
        width = 50
      }
    }
  }

  column "center_small" {
    width = 25
  }

  column "center" {
    width = 25

    row "center_top" {
      height = 50

      column "center_top_left" {
        width = 50
      }

      column "center_top_right" {
        width = 50
      }
    }

    row "center_bottom" {
      height = 50
    }
  }

  column "right" {
    width = 25

    row "right_top" {
      height = 50
    }

    row "right_bottom" {
      height = 50

      column "right_bottom_left" {
        width = 50
      }

      column "right_bottom_right" {
        width = 50
      }
    }
  }
}