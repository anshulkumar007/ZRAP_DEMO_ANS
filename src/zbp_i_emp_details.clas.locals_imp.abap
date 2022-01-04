CLASS lhc_ZEMPDetails DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR EMPDetails RESULT result.

    METHODS setActive FOR MODIFY
      IMPORTING keys FOR ACTION EMPDetails~setActive RESULT result.

    METHODS changeSalary FOR DETERMINE ON SAVE
      IMPORTING keys FOR EMPDetails~changeSalary.

    METHODS validateAge FOR VALIDATE ON SAVE
      IMPORTING keys FOR EMPDetails~validateAge.

ENDCLASS.

CLASS lhc_ZEMPDetails IMPLEMENTATION.

  METHOD get_instance_features.

    READ ENTITIES OF zi_emp_details IN LOCAL MODE
        ENTITY EMPDetails
        FIELDS ( Active ) WITH CORRESPONDING #( keys )
        RESULT DATA(members)
        FAILED failed.

    result = VALUE #(
    FOR member IN members


      LET status = COND #( WHEN member-Active = abap_true
      THEN if_abap_behv=>fc-o-disabled
      ELSE if_abap_behv=>fc-o-enabled )

    IN
    ( %tky = member-%tky
    %action-setActive = status )


    ).

  ENDMETHOD.

  METHOD setActive.


    MODIFY ENTITIES OF zi_emp_details IN LOCAL MODE
         ENTITY EMPDetails
         UPDATE
         FIELDS ( Active ) WITH VALUE #( FOR key IN keys
                                        ( %tky = key-%tky
                                           Active = abap_true ) )
                    FAILED failed
                    REPORTED reported      .

    READ ENTITIES OF zi_emp_details IN LOCAL MODE
         ENTITY EMPDetails
         ALL FIELDS WITH CORRESPONDING #( keys )
         RESULT DATA(members).

    result = VALUE #( FOR member IN members
                       ( %tky = member-%tky
                        %param = member ) ).


  ENDMETHOD.

  METHOD changeSalary.
    READ ENTITIES OF zi_emp_details IN LOCAL MODE
        ENTITY EMPDetails
        FIELDS ( Role ) WITH CORRESPONDING #( keys )
        RESULT DATA(members).

    LOOP AT members INTO DATA(member).
      IF  member-Role = 'Developer'.
        MODIFY ENTITIES OF zi_emp_details IN LOCAL MODE
       ENTITY EMPDetails
       UPDATE
       FIELDS ( Salary ) WITH VALUE #( ( %tky = member-%tky
                                         Salary = 7000 ) ).

      ENDIF.

      IF  member-Role = 'Lead'.
        MODIFY ENTITIES OF zi_emp_details IN LOCAL MODE
       ENTITY EMPDetails
       UPDATE
       FIELDS ( Salary ) WITH VALUE #( ( %tky = member-%tky
                                         Salary = 9000 ) ).

      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD validateAge.

    READ ENTITIES OF zi_emp_details IN LOCAL MODE
          ENTITY EMPDetails
          FIELDS ( Age ) WITH CORRESPONDING #( keys )
          RESULT DATA(members).

    LOOP AT members INTO DATA(member).
      IF  member-Age < 21.
        APPEND VALUE #( %tky = member-%tky ) TO failed-empdetails.
      ENDIF.
    ENDLOOP.
 ENDMETHOD.

ENDCLASS.
