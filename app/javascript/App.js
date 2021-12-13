import React from 'react';

import store from 'store';
import { Provider } from 'react-redux';
import TaskBoard from 'containers/TaskBoard';
import MUITheme from 'MUITheme/MUITheme';
import { ThemeProvider } from '@material-ui/styles';

const App = () => (
  <Provider store={store}>
    <ThemeProvider theme={MUITheme}>
      <TaskBoard />
    </ThemeProvider>
  </Provider>
);

export default App;
