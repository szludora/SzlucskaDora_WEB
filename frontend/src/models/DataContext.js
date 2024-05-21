import axios from "axios";
import { createContext, useContext, useState } from "react";

const DataContext = createContext();

export const DataProvider = ({ children }) => {
  const [szavak, setSzavak] = useState([{}]);

  async function szavakLekerdez() {
    try {
      const resp = await axios.get("http://localhost:8000/api/szavak");
      console.log(resp.data);
      setSzavak(resp.data);
    } catch (error) {
      console.log(error);
    }
  }

  return (
    <DataContext.Provider value={{ szavakLekerdez, szavak }}>
      {children}
    </DataContext.Provider>
  );
};

export default function useDataContext() {
  return useContext(DataContext);
}
