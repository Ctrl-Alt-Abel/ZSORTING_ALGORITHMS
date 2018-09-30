*&---------------------------------------------------------------------*
*&  Include           ZSORTING_ALGORITHMS
*&---------------------------------------------------------------------*

TYPE-POOLS abap.

INCLUDE zlogger.

*----------------------------------------------------------------------*
*       CLASS lcl_sorting_algo DEFINITION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_sorting_algo DEFINITION ABSTRACT.
  PUBLIC SECTION.
*    INTERFACES lif_check_struct.
    METHODS:
              sort ABSTRACT CHANGING im_elements TYPE abadr_tab_int4
                                     im_verbose  TYPE abap_bool DEFAULT abap_false.

ENDCLASS.                    "lcl_sorting_algo DEFINITION

INCLUDE zbubble_sort.

INCLUDE zinsertion_sort.

**----------------------------------------------------------------------*
**       INTERFACE lif_check_struct
**----------------------------------------------------------------------*
**
**----------------------------------------------------------------------*
*INTERFACE lif_check_struct.
*  METHODS check_struct IMPORTING im_elements TYPE STANDARD TABLE.
*ENDINTERFACE.                    "lif_check_struct

**----------------------------------------------------------------------*
**       CLASS lcl_sorting_algo IMPLEMENTATION
**----------------------------------------------------------------------*
**
**----------------------------------------------------------------------*
*CLASS lcl_sorting_algo IMPLEMENTATION.
*
*  METHOD lif_check_struct~check_struct.
*
*    DATA r_tabdescr TYPE REF TO cl_abap_tabledescr.
*    DATA r_structdescr TYPE REF TO cl_abap_structdescr.
*    DATA r_error TYPE REF TO cx_root.
*    DATA err_str TYPE string.
*    DATA it_components TYPE abap_compdescr_tab.
*    FIELD-SYMBOLS <fs_component> TYPE abap_compdescr.
*
*    TRY.
*        r_tabdescr ?= cl_abap_tabledescr=>describe_by_data( im_elements ).
*      CATCH cx_root INTO r_error.
*        err_str = r_error->if_message~get_text( ).
*        lcl_error=>log_error_console( err_str ).
*    ENDTRY.
*
*    TRY.
*        r_structdescr ?= r_tabdescr->get_table_line_type( ).
*      CATCH cx_root INTO r_error.
*        err_str = r_error->if_message~get_text( ).
*        lcl_error=>log_error_console( err_str ).
*    ENDTRY.
*
*    it_components = r_structdescr->components.
*
*    IF LINES( it_components ) > 1.
*      lcl_error=>log_error_console( 'Table structure must have max of 1 element' ).
*    ELSE.
*      READ TABLE it_components ASSIGNING <fs_component> INDEX 1.
*      IF <fs_component>-type_kind <> 'I' AND <fs_component>-type_kind <> 'C'.
*        lcl_error=>log_error_console( 'Sorting can only be performed on data types INT or CHAR' ).
*      ENDIF.
*    ENDIF.
*
*  ENDMETHOD.                    "lif_check_struct~check_struct
*
*ENDCLASS.                    "lcl_sorting_algo IMPLEMENTATION
