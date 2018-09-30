*&---------------------------------------------------------------------*
*&  Include           ZINSERTION_SORT
*&---------------------------------------------------------------------*

*----------------------------------------------------------------------*
*       CLASS lcl_insertion_sort DEFINITION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_insertion_sort DEFINITION INHERITING FROM lcl_sorting_algo FINAL.
  PUBLIC SECTION.
    METHODS sort REDEFINITION.
ENDCLASS.                    "lcl_insertion_sort DEFINITION

*----------------------------------------------------------------------*
*       CLASS lcl_insertion_sort IMPLEMENTATION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_insertion_sort IMPLEMENTATION.

  METHOD sort.
    DATA: element TYPE i,
          prev_elem TYPE i,
          temp TYPE i,
          inner_indx TYPE i,
          inner_indx_sub_one TYPE i.

    LOOP AT im_elements INTO element FROM 2.
      temp = element.
      inner_indx = sy-tabix.
      inner_indx_sub_one = inner_indx - 1.

      WHILE  inner_indx_sub_one > 0.
        READ TABLE im_elements INTO prev_elem INDEX inner_indx_sub_one.
        IF prev_elem > temp.
          MODIFY im_elements INDEX inner_indx FROM prev_elem.
          MODIFY im_elements INDEX inner_indx_sub_one FROM element.
        ELSE.
          EXIT.
        ENDIF.
        inner_indx = inner_indx - 1.
        inner_indx_sub_one = inner_indx_sub_one - 1.
      ENDWHILE.

    ENDLOOP.

  ENDMETHOD.                    "sort

ENDCLASS.                    "lcl_insertion_sort IMPLEMENTATION
