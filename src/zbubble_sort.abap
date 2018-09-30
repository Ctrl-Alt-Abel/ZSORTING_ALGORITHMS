*&---------------------------------------------------------------------*
*&  Include           ZBUBBLE_SORT
*&---------------------------------------------------------------------*

*----------------------------------------------------------------------*
*       CLASS lcl_bubble_sort DEFINITION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_bubble_sort DEFINITION INHERITING FROM lcl_sorting_algo FINAL.
  PUBLIC SECTION.
    METHODS sort REDEFINITION.

ENDCLASS.                    "lcl_bubble_sort DEFINITION

*----------------------------------------------------------------------*
*       CLASS lcl_bubble_sort IMPLEMENTATION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_bubble_sort IMPLEMENTATION.

  METHOD sort.
    DATA: element TYPE i,
          nxt_element TYPE i,
          sorted TYPE abap_bool,
          curr_index TYPE sy-tabix,
          nxt_index TYPE sy-tabix,
          table_length_plus_one TYPE i.

    table_length_plus_one = LINES( im_elements ) + 1.

    WHILE sorted = abap_false.
      sorted = abap_true.
      LOOP AT im_elements INTO element.
        curr_index = sy-tabix.
        nxt_index = curr_index + 1.
        IF nxt_index <> table_length_plus_one.
          READ TABLE im_elements INTO nxt_element INDEX nxt_index.
          IF element > nxt_element.
            MODIFY im_elements INDEX curr_index FROM nxt_element.
            MODIFY im_elements INDEX nxt_index FROM element.
            sorted = abap_false.
          ENDIF.
        ENDIF.
      ENDLOOP.
    ENDWHILE.

  ENDMETHOD.                    "sort

ENDCLASS.                    "lcl_bubble_sort IMPLEMENTATION
