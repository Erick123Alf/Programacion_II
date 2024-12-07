#include <windows.h>
#include <sql.h>
#include <sqlext.h>
#include <iostream>
#include <iomanip>
using namespace std;


int main() {
    SQLHENV hEnv;
    SQLHDBC hDbc;
    SQLRETURN ret;
    // Asignar un gestor de entorno
    ret = SQLAllocHandle(SQL_HANDLE_ENV, SQL_NULL_HANDLE, &hEnv);
    ret = SQLSetEnvAttr(hEnv, SQL_ATTR_ODBC_VERSION, (SQLPOINTER)SQL_OV_ODBC3, 0);

    // Asignar un gestor de conexión
    ret = SQLAllocHandle(SQL_HANDLE_DBC, hEnv, &hDbc);

    // Conectarse a la base de datos
    ret = SQLConnect(hDbc, (SQLWCHAR*)L"sqlserver", SQL_NTS, (SQLWCHAR*)L"Username", SQL_NTS, (SQLWCHAR*)L"Password", SQL_NTS);
    if (ret == SQL_SUCCESS || ret == SQL_SUCCESS_WITH_INFO) {
        cout << "Conectado a la base de datos exitosamente." << endl;
        SQLHSTMT hStmt;
        ret = SQLAllocHandle(SQL_HANDLE_STMT, hDbc, &hStmt);
        wcout << L"+------+----------------------+-------------+------------+--------------------+-------------------------+---------------------------------------------------+----------+" << endl;
        wcout << L"| No.  |   Nombre Completo    |   Fecha     |    RFC     |  Centro_de_Trabajo |          Puesto         |         Descripcion del Puesto                    |Directivo |" << endl;
        wcout << L"+------+----------------------+-------------+------------+--------------------+-------------------------+---------------------------------------------------+----------+" << endl;

        //Select a la base de datos
        ret = SQLExecDirect(hStmt, (SQLWCHAR*)L"SELECT * FROM Empleado2", SQL_NTS);
        if (ret == SQL_SUCCESS || ret == SQL_SUCCESS_WITH_INFO) {
            int num_empleado;
            SQLWCHAR name[50];
            SQLWCHAR last_name[50];
            SQLWCHAR slast_name[50];
            SQLWCHAR directivo[50];
            SQLWCHAR b_day[50];
            SQLWCHAR rfc[50];
            SQLWCHAR Centro_Trabajo[50];
            SQLWCHAR puesto[50];
            SQLWCHAR desc_puesto[50];


            while (SQLFetch(hStmt) == SQL_SUCCESS) {
                SQLGetData(hStmt, 1, SQL_C_LONG, &num_empleado, 0, NULL);
                SQLGetData(hStmt, 2, SQL_C_WCHAR, name, sizeof(name), NULL);
                SQLGetData(hStmt, 3, SQL_C_WCHAR, last_name, sizeof(last_name), NULL);
                SQLGetData(hStmt, 4, SQL_C_WCHAR, slast_name, sizeof(slast_name), NULL);
                SQLGetData(hStmt, 5, SQL_C_WCHAR, b_day, sizeof(b_day), NULL);
                SQLGetData(hStmt, 6, SQL_C_WCHAR, rfc, sizeof(rfc), NULL);
                SQLGetData(hStmt, 7, SQL_C_WCHAR, Centro_Trabajo, sizeof(Centro_Trabajo), NULL);
                SQLGetData(hStmt, 8, SQL_C_WCHAR, puesto, sizeof(puesto), NULL);
                SQLGetData(hStmt, 9, SQL_C_WCHAR, desc_puesto, sizeof(desc_puesto), NULL);
                SQLGetData(hStmt, 10, SQL_C_WCHAR, directivo, sizeof(directivo), NULL);
                
                //Concatenar apellido paterno + apellido materno

                wstring last_names = wstring(last_name) + L" " + wstring(slast_name);
                wstring full_name = wstring(name) + L" " + wstring(last_names);
                wstring dir = wstring(directivo);
                wstring resp;

                if (dir == L"1")
                {
                    resp = L"Si";
                }
                else
                {
                    resp = L"No";
                }

                //Impresion de datos de la fila
                wcout << L"|" << setw(6) << left << num_empleado << 
                 L"|" << setw(22) << left << full_name <<
                 L"|" << setw(13) << left << b_day << 
                 L"|" << setw(12) << left << rfc << 
                 L"|" << setw(20) << left << Centro_Trabajo <<
                 L"|" << setw(25) << left << puesto << 
                 L"|" << setw(51) << left << desc_puesto <<
                 L"|" << setw(10) << left << resp << L"|" <<endl;
                
                   
            }
           
        }
        wcout << L"+------+----------------------+-------------+------------+--------------------+-------------------------+---------------------------------------------------+----------+" << endl;

        // Liberar el manejador de conexión
        SQLFreeHandle(SQL_HANDLE_STMT, hStmt);
    }
    else {
        cout << "Fallo la conexion a la base de datos" << endl;
    }

    // Desconectar y liberar gestores de entorno
    SQLDisconnect(hDbc);
    SQLFreeHandle(SQL_HANDLE_DBC, hDbc);
    SQLFreeHandle(SQL_HANDLE_ENV, hEnv);
    return 0;
}