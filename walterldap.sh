#!/bin/bash

# ==========================================
# CONFIGURACIÓN DEL DOMINIO OPENLDAP
# ==========================================
DOMINIO="dc=walter2026,dc=ldap"
USUARIO_ADMIN="cn=admin,$DOMINIO"

# ==========================================
# FUNCIONES
# ==========================================

# Pedir contraseña del administrador
pedir_clave() {
    echo "Contraseña de admin LDAP:"
    read -s admin_pass
    echo ""
}

# Opción 1: Eliminar correo de un usuario
eliminar_correo() {
    echo ""
    echo "--- ELIMINAR CORREO DE UN USUARIO ---"
    echo "UID del usuario (ej: walteralu1):"
    read uid_user
    echo "Unidad Organizativa (Alumnado/Profesorado):"
    read ou_user
    pedir_clave

    # Escribimos el archivo LDIF temporal
    echo "dn: cn=${uid_user},ou=${ou_user},${DOMINIO}" > del_mail.ldif
    echo "changetype: modify" >> del_mail.ldif
    echo "delete: mail" >> del_mail.ldif

    # Modificamos usando el archivo -f y luego lo borramos
    ldapmodify -x -D "$USUARIO_ADMIN" -w "$admin_pass" -f del_mail.ldif
    rm -f del_mail.ldif
}

# Opción 2: Modificar correo de un usuario
modificar_correo() {
    echo ""
    echo "--- MODIFICAR CORREO DE UN USUARIO ---"
    echo "UID del usuario (ej: walteralu2):"
    read uid_user
    echo "Unidad Organizativa (Alumnado/Profesorado):"
    read ou_user
    echo "Nuevo correo:"
    read nuevo_mail
    pedir_clave

    # Generación del archivo LDIF temporal para la modificación
    echo "dn: cn=${uid_user},ou=${ou_user},${DOMINIO}" > mod_mail.ldif
    echo "changetype: modify" >> mod_mail.ldif
    echo "replace: mail" >> mod_mail.ldif
    echo "mail: ${nuevo_mail}" >> mod_mail.ldif

    # Modificamos usando el archivo -f y luego lo borramos
    ldapmodify -x -D "$USUARIO_ADMIN" -w "$admin_pass" -f mod_mail.ldif
    rm -f mod_mail.ldif
}

# Opción 3a: Buscar un usuario concreto
buscar_usuario() {
    echo "UID del usuario a buscar:"
    read busca_uid
    echo ""
    ldapsearch -x -b "$DOMINIO" "(uid=$busca_uid)"
}

# Opción 3b: Listar todos los usuarios
listar_usuarios() {
    echo ""
    echo "=== LISTADO DE USUARIOS (NOMBRE Y CORREO) ==="
    ldapsearch -x -b "$DOMINIO" "(objectClass=inetOrgPerson)" cn mail
}

# ==========================================
# MENÚ PRINCIPAL (BUCLE)
# ==========================================
while true; do
    echo "=========================================="
    echo "    MENÚ DE GESTIÓN OPENLDAP - WALTER"
    echo "=========================================="
    echo "1. Eliminar correo de un usuario"
    echo "2. Modificar correo de un usuario"
    echo "3. Realizar búsquedas (Usuario o Listado)"
    echo "4. Salir"
    echo "=========================================="
    echo "Seleccione una opción [1-4]:"
    read opcion

    case "$opcion" in
        1)
            eliminar_correo
            echo "Presione Enter para continuar..."
            read pausa
            ;;
        2)
            modificar_correo
            echo "Presione Enter para continuar..."
            read pausa
            ;;
        3)
            echo ""
            echo "a) Buscar un usuario concreto"
            echo "b) Listar TODOS los usuarios"
            echo "Seleccione subopción [a/b]:"
            read subopcion

            if [ "$subopcion" = "a" ]; then
                buscar_usuario
            elif [ "$subopcion" = "b" ]; then
                listar_usuarios
            else
                echo "Opción no válida."
            fi
            echo "Presione Enter para continuar..."
            read pausa
            ;;
        4)
            echo "Saliendo del script..."
            exit
            ;;
        *)
            echo "Opción no válida, intente de nuevo."
            read pausa
            ;;
    esac
done
=======
#!/bin/bash

# Configuración del dominio OpenLDAP
SUFFIX="dc=walter2026,dc=ldap"
BINDDN="cn=admin,$SUFFIX"

while true; do
    echo "=========================================="
    echo "    MENÚ DE GESTIÓN OPENLDAP - WALTER"
    echo "=========================================="
    echo "1. Eliminar correo de un usuario"
    echo "2. Modificar correo de un usuario"
    echo "3. Realizar búsquedas (Usuario o Listado)"
    echo "4. Salir"
    echo "=========================================="
    read -p "Seleccione una opción [1-4]: " opcion

    case $opcion in
        1)
            echo ""
            echo "--- ELIMINAR CORREO DE UN USUARIO ---"
            read -p "Introduzca el UID del usuario (ej: walteralu1): " uid_user
            read -p "Unidad Organizativa [Alumnado/Profesorado]: " ou_user
            read -sp "Contraseña de admin LDAP: " admin_pass
            echo ""

            # Creación del archivo temporal LDIF para borrar el atributo mail
            cat << LDIF_DEL > /tmp/del_mail.ldif
dn: cn=${uid_user},ou=${ou_user},${SUFFIX}
changetype: modify
delete: mail
LDIF_DEL

            ldapmodify -x -D "$BINDDN" -w "$admin_pass" -f /tmp/del_mail.ldif
            rm -f /tmp/del_mail.ldif
            echo ""
            read -p "Presione Enter para continuar..."
            ;;

        2)
            echo ""
            echo "--- MODIFICAR CORREO DE UN USUARIO ---"
            read -p "Introduzca el UID del usuario (ej: walteralu2): " uid_user
            read -p "Unidad Organizativa [Alumnado/Profesorado]: " ou_user
            read -p "Nuevo correo electrónico: " nuevo_mail
            read -sp "Contraseña de admin LDAP: " admin_pass
            echo ""

            # Creación del archivo temporal LDIF para reemplazar/añadir el atributo mail
            cat << LDIF_MOD > /tmp/mod_mail.ldif
dn: cn=${uid_user},ou=${ou_user},${SUFFIX}
changetype: modify
replace: mail
mail: ${nuevo_mail}
LDIF_MOD

            ldapmodify -x -D "$BINDDN" -w "$admin_pass" -f /tmp/mod_mail.ldif
            rm -f /tmp/mod_mail.ldif
            echo ""
            read -p "Presione Enter para continuar..."
            ;;

        3)
            echo ""
            echo "--- BÚSQUEDAS EN LDAP ---"
            echo "a) Consultar un usuario concreto"
            echo "b) Listar TODOS los usuarios (solo Nombre y Correo)"
            read -p "Seleccione subopción [a/b]: " subopc

            if [ "$subopc" = "a" ]; then
                read -p "Introduzca el UID del usuario a buscar: " busca_uid
                echo ""
                ldapsearch -x -b "$SUFFIX" "(uid=$busca_uid)"
            elif [ "$subopc" = "b" ]; then
                echo ""
                echo "=== LISTADO DE USUARIOS (NOMBRE Y CORREO) ==="
                ldapsearch -x -b "$SUFFIX" "(objectClass=inetOrgPerson)" cn mail
            else
                echo "Subopción no válida."
            fi
            echo ""
            read -p "Presione Enter para continuar..."
            ;;

        4)
            echo "Saliendo del script..."
            exit 0
            ;;

        *)
            echo "Opción no válida."
            sleep 1
            ;;
    esac
done
EOF
