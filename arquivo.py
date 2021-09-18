from robot.libraries.BuiltIn import BuiltIn, register_run_keyword
import threading

class WaitAsync:
    def run_async(name, *args):
        threading.Thread(target=name, args=args).start()
        return BuiltIn().run_keyword(name, *args)

register_run_keyword(WaitAsync, 'Run Async', 1)

def _threaded(self, keyword, *args, **kwargs):
        try:
            import queue
        except ImportError:
            import Queue as queue
        import threading
        
        def wrapped_f(q, *args, **kwargs):
            ''' Calls the decorated function and puts the result in a queue '''
            f = self._get_handler_from_keyword(keyword)
            ret = f.run(EXECUTION_CONTEXTS.current, args)
            q.put(ret)

        q = queue.Queue()
        t = threading.Thread(target=wrapped_f, args=(q,)+args, kwargs=kwargs)
        t.result_queue = q
        return t

# def my_run_keyword_if(self, expression, name, *args):
#             # do something
#             return BuiltIn().run_keyword_if(expression, name, *args)

# class WaitAsync:
#     def __init__(self):
#         self._thread_pool = {}
#         self._last_thread_handle = 0

#     def run_async(self, keyword, *args, **kwargs):
#         handle = self._last_thread_handle
#         thread = self.Threaded(keyword, *args, **kwargs)
#         thread.start()
#         self._thread_pool[handle] = thread
#         self._last_thread_handle += 1
#         return handle

    
#     def threaded(self, keyword, *args, **kwargs):

#         def wrapped_f(q, *args, **kwargs):
#             ''' Calls the decorated function and puts the result in a queue '''
#             f = self._get_handler_from_keyword(keyword)
#             ret = f.run(EXECUTION_CONTEXTS.current, args)
#             q.put(ret)

#         q = queue.Queue()
#         t = threading.Thread(target=wrapped_f, args=(q,)+args, kwargs=kwargs)
#         t.result_queue = q
#         return t

#     def _get_handler_from_keyword(self, keyword):
#         ''' Gets the Robot Framework handler associated with the given keyword '''
#         return EXECUTION_CONTEXTS.current.get_handler(keyword)

    # def wait_customized(
    #         self,
    #         locator: Union[WebElement, None, str],
    #         timeout: Optional[timedelta] = None,
    #         error: Optional[str] = None,
    #     ):
    #     handle = self._last_thread_handle
    #     thread = threading.Thread()
    #     self._wait_until(
    #             lambda: self.is_visible(locator),
    #             f"Element '{locator}' not visible after <TIMEOUT>.",
    #             timeout,
    #             error,
    #         )
        