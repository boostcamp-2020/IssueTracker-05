import axios from 'axios';
import { useEffect } from 'react';

const getLabels = (callback) => {
  useEffect(() => {
    axios.get('/api/label').then(({ data }) => {
      return data;
    });
  }, []);
};

export default { getLabels };
